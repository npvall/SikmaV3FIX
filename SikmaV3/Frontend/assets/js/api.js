// Lokasi file: SikmaV3/Frontend/assets/js/api.js (Versi Final Terkonfirmasi)

const API_BASE_URL = window.sikmaApp?.baseUrl
  ? `${window.sikmaApp.baseUrl}/auth.php`
  : "auth.php";
const FLASK_API_URL = "http://localhost:5001";

// Fungsi untuk backend PHP
async function fetchAPI(action, options = {}) {
  const defaultOptions = { method: "POST", headers: {} };
  const mergedOptions = { ...defaultOptions, ...options };
  if (mergedOptions.body instanceof FormData) {
    delete mergedOptions.headers["Content-Type"];
  } else if (
    typeof mergedOptions.body === "object" &&
    !(mergedOptions.body instanceof FormData)
  ) {
    const params = new URLSearchParams();
    for (const key in mergedOptions.body) {
      if (mergedOptions.body.hasOwnProperty(key))
        params.append(key, mergedOptions.body[key]);
    }
    mergedOptions.body = params.toString();
    mergedOptions.headers["Content-Type"] = "application/x-www-form-urlencoded";
  }
  let requestUrl = API_BASE_URL;
  if (mergedOptions.method.toUpperCase() === "GET") {
    const params = new URLSearchParams(mergedOptions.body || {});
    params.append("action", action);
    requestUrl = `${API_BASE_URL}?${params.toString()}`;
    delete mergedOptions.body;
  } else if (mergedOptions.body instanceof FormData) {
    mergedOptions.body.append("action", action);
  } else if (typeof mergedOptions.body === "string") {
    const params = new URLSearchParams(mergedOptions.body);
    params.append("action", action);
    mergedOptions.body = params.toString();
  }
  try {
    const response = await fetch(requestUrl, mergedOptions);
    let data;
    try {
      data = await response.json();
    } catch (e) {
      if (!response.ok)
        return {
          status: "error",
          message: `Kesalahan Server (Status: ${response.status})`,
        };
      return { status: "error", message: "Respons server tidak valid." };
    }
    if (!response.ok)
      return {
        status: "error",
        message:
          data?.message || `Kesalahan Server (Status: ${response.status})`,
        errors: data?.errors,
      };
    return data;
  } catch (error) {
    console.error("Fetch API Error (PHP):", error);
    return { status: "error", message: "Masalah jaringan ke server PHP." };
  }
}

const Api = {
  // --- Panggilan ke Backend PHP ---
  register: (formData) => fetchAPI("register", { body: formData }),
  login: (formData) => fetchAPI("login", { body: formData }),
  logout: () => fetchAPI("logout"),
  checkSession: () => fetchAPI("check_session"),
  updateUserProfile: (formData) =>
    fetchAPI("update_profile", { body: formData }),
  changePassword: (formData) => fetchAPI("change_password", { body: formData }),
  saveFullProfileData: (profileDataPayload) => {
    const formData = new FormData();
    for (const key in profileDataPayload) {
      if (profileDataPayload.hasOwnProperty(key))
        formData.append(key, profileDataPayload[key]);
    }
    return fetchAPI("save_full_profile", { body: formData });
  },
  getProfileData: () => fetchAPI("get_profile_data", { method: "GET" }),
  getCompanyDetails: (companyId) =>
    fetchAPI("get_company_details", {
      method: "GET",
      body: { company_id: companyId },
    }),
  deactivateAccount: (password) =>
    fetchAPI("deactivate_account", { body: { current_password: password } }),

  // --- Panggilan ke Backend Python (Flask) ---
  getRecommendations: async (userProfile) => {
    try {
      const response = await fetch(`${FLASK_API_URL}/recommendations`, {
        method: "POST",
        headers: {
          Accept: "application/json",
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ skills: userProfile.skills || [] }),
      });
      if (!response.ok)
        throw new Error(`HTTP error! status: ${response.status}`);
      return await response.json();
    } catch (error) {
      console.error("Gagal terhubung ke server rekomendasi (Flask):", error);
      return {
        status: "error",
        message: "Tidak dapat terhubung ke server ML.",
      };
    }
  },

  getCompanyList: async () => {
    try {
      const response = await fetch(`${FLASK_API_URL}/companies`);
      if (!response.ok)
        throw new Error(`HTTP error! status: ${response.status}`);
      return await response.json();
    } catch (error) {
      console.error("Gagal terhubung ke server perusahaan (Flask):", error);
      return {
        status: "error",
        message: "Tidak dapat terhubung ke server ML.",
      };
    }
  },
};
