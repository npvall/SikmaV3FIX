# Lokasi file: SikmaV3/Backend/app.py (Versi Final dengan Jaminan Struktur Data)

import os
from flask import Flask, request, jsonify
from flask_cors import CORS
import pandas as pd
import pymysql
import json
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity

# --- Konfigurasi Database ---
DB_CONFIG = {
    'host': '127.0.0.1',
    'user': 'root',
    'password': '',
    'database': 'sikma_dbv3',
    'cursorclass': pymysql.cursors.DictCursor
}

app = Flask(__name__)
CORS(app)

def get_db_connection():
    try:
        conn = pymysql.connect(**DB_CONFIG)
        return conn
    except pymysql.MySQLError as e:
        print(f"!!! GAGAL KONEKSI KE DATABASE: {e} !!!")
        return None

def get_all_companies_data():
    conn = get_db_connection()
    if conn is None: return pd.DataFrame()
    try:
        # Query mengambil semua kolom yang dibutuhkan
        query = """
            SELECT
                c.id, c.name, c.description_short, c.logo_url,
                c.banner_image_url, cc.name AS category, ct.name AS type
            FROM companies c
            LEFT JOIN company_categories cc ON c.category_id = cc.id
            LEFT JOIN company_types ct ON c.type_id = ct.id
            WHERE c.is_active = 1
        """
        df = pd.read_sql(query, conn)
        return df
    finally:
        if conn: conn.close()

# --- Endpoint API ---

@app.route('/companies', methods=['GET'])
def get_all_companies_endpoint():
    companies_df = get_all_companies_data()
    if companies_df.empty:
        return jsonify({'status': 'success', 'companies': []})
    
    # --- PERBAIKAN UTAMA: Membuat list of dictionary secara manual ---
    companies_list = []
    for index, row in companies_df.iterrows():
        companies_list.append({
            "id": row['id'],
            "name": row['name'],
            "description": row['description_short'], # Pastikan nama kolom sesuai
            "logo_url": row['logo_url'],
            "imageUrl": row['banner_image_url'],
            "category": row['category'],
            "type": row['type']
        })
    # -----------------------------------------------------------------
    
    return jsonify({'status': 'success', 'companies': companies_list})

@app.route('/recommendations', methods=['POST'])
def get_recommendations():
    user_input = request.json
    user_profile_text = " ".join(user_input.get('skills', []))
    all_companies_df = get_all_companies_data()

    if all_companies_df.empty:
        return jsonify({'status': 'success', 'data': []})

    all_companies_df['profile_text'] = all_companies_df.apply(
        lambda row: f"{row['name']} {row['category']} {row['description_short']}",
        axis=1
    )

    vectorizer = TfidfVectorizer(min_df=1)
    company_vectors = vectorizer.fit_transform(all_companies_df['profile_text'])

    if not user_profile_text.strip():
        return jsonify({'status': 'success', 'data': []})

    user_vector = vectorizer.transform([user_profile_text])
    similarities = cosine_similarity(user_vector, company_vectors).flatten()
    all_companies_df['match_percentage'] = similarities * 100

    recommendations_df = all_companies_df[all_companies_df['match_percentage'] > 0.1].sort_values(
        by='match_percentage', ascending=False
    ).head(10)

    # --- PERBAIKAN UTAMA: Membuat list of dictionary secara manual ---
    final_results = []
    for index, item in recommendations_df.iterrows():
        final_results.append({
            'id_perusahaan': item['id'],
            'nama_perusahaan': item['name'],
            'kategori_bidang': item['category'],
            'deskripsi_singkat': item['description_short'],
            'logo_url': item['logo_url'],
            'imageUrl': item['banner_image_url'],
            'match_percentage': round(item['match_percentage'], 2),
            'alasan_rekomendasi': f"Kecocokan berdasarkan profil perusahaan di bidang {item['category']}."
        })
    # -----------------------------------------------------------------

    return jsonify({'status': 'success', 'data': final_results})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001, debug=True)