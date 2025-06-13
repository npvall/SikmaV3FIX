// Lokasi file: SikmaV3/Frontend/assets/js/page_home.js (Versi Final dengan Debugging)

const PageHome = {
  // ... (Properti DOM dan State tetap sama) ...
  recommendationSwiperWrapper: null,
  recommendationSwiperContainer: null,
  noRecommendationsMessage: null,
  companyCategoryFilter: null,
  companyGrid: null,
  activeFilterDisplay: null,
  noCompanyResultsMessage: null,
  companyListLoading: null,
  recommendationSwiperInstance: null,
  allCompanyData: [],
  isPageInitialized: false,

  initialize: () => {
    if (PageHome.isPageInitialized) return;
    PageHome.recommendationSwiperWrapper = UI.getElement(
      "#recommendationSwiperWrapper"
    );
    PageHome.recommendationSwiperContainer = UI.getElement(
      ".recommendation-swiper-container"
    );
    PageHome.noRecommendationsMessage = UI.getElement(
      "#noRecommendationsMessage"
    );
    PageHome.companyCategoryFilter = UI.getElement("#companyCategoryFilter");
    PageHome.companyGrid = UI.getElement("#companyGrid");
    PageHome.noCompanyResultsMessage = UI.getElement(
      "#noCompanyResultsMessage"
    );
    PageHome.companyListLoading = UI.getElement("#companyListLoading");
    PageHome._initCategoryFilter();
    PageHome._initCompanyCardLinks();
    PageHome.isPageInitialized = true;
  },

  loadPageData: async () => {
    console.log("PageHome: Memulai pemuatan data halaman...");
    if (!PageHome.isPageInitialized) PageHome.initialize();
    PageHome.resetPageVisuals();
    await PageHome._loadAndDisplayCompanies();
    await PageHome._populateRecommendationSwiper();
    console.log("PageHome: Pemuatan data halaman selesai.");
  },

  resetPageVisuals: () => {
    if (PageHome.recommendationSwiperInstance) {
      try {
        PageHome.recommendationSwiperInstance.destroy(true, true);
      } catch (e) {}
      PageHome.recommendationSwiperInstance = null;
    }
    if (PageHome.recommendationSwiperWrapper)
      PageHome.recommendationSwiperWrapper.innerHTML = "";
    if (PageHome.companyGrid) PageHome.companyGrid.innerHTML = "";
    if (PageHome.companyCategoryFilter)
      PageHome.companyCategoryFilter.value = "";
    if (PageHome.noRecommendationsMessage)
      UI.hideElement(PageHome.noRecommendationsMessage);
    if (PageHome.noCompanyResultsMessage)
      UI.hideElement(PageHome.noCompanyResultsMessage);
    if (PageHome.companyListLoading)
      UI.hideElement(PageHome.companyListLoading);
  },

  _loadAndDisplayCompanies: async () => {
    if (!PageHome.companyGrid) return;
    UI.showElement(PageHome.companyListLoading, "block");
    const response = await Api.getCompanyList();

    // --- DEBUGGING POINT ---
    console.log("Data diterima dari /companies:", response);

    UI.hideElement(PageHome.companyListLoading);
    if (response.status === "success" && Array.isArray(response.companies)) {
      PageHome.allCompanyData = response.companies;
      PageHome.companyGrid.innerHTML = "";
      if (response.companies.length === 0) {
        UI.showElement(PageHome.noCompanyResultsMessage, "block");
      } else {
        UI.hideElement(PageHome.noCompanyResultsMessage);
        response.companies.forEach((company) =>
          PageHome.addCompanyToGrid(company)
        );
      }
    } else {
      PageHome.companyGrid.innerHTML = `<p class="text-danger">${
        response.message || "Gagal memuat daftar perusahaan."
      }</p>`;
    }
  },

  addCompanyToGrid: (companyData) => {
    if (!PageHome.companyGrid) return;
    const card = document.createElement("div");
    card.className = `card card-hover-effect`;
    card.dataset.companyId = companyData.id;
    card.dataset.category = companyData.category || "Lainnya";
    // Gunakan ID yang konsisten, periksa id_perusahaan dari Flask atau id standar
    const companyId = companyData.id_perusahaan || companyData.id;

    // Memastikan setiap data diambil dengan benar
    const name = UI.escapeHTML(
      companyData.nama_perusahaan || companyData.name || "Nama Perusahaan"
    );
    const categoryDisplay = UI.escapeHTML(
      companyData.kategori_bidang || companyData.category || "Kategori"
    );
    const typeDisplay = UI.escapeHTML(
      companyData.tipe_perusahaan || companyData.type || "Tipe"
    );
    const description = UI.escapeHTML(
      companyData.deskripsi_singkat ||
        companyData.description ||
        "Deskripsi tidak tersedia."
    );
    let rawImageUrl = companyData.logo_url || companyData.imageUrl;
    if (
      typeof rawImageUrl !== "string" ||
      rawImageUrl.trim() === "" ||
      (!rawImageUrl.startsWith("http") && !rawImageUrl.startsWith("data:"))
    ) {
      // Jika bukan string, kosong, atau bukan URL absolut (http/https) atau data URI, gunakan placeholder
      rawImageUrl = `https://placehold.co/325x200/EEE/888?text=${encodeURIComponent(
        name
      )}`;
    }
    const imageUrl = UI.escapeHTML(rawImageUrl); // Escape setelah memastikan itu URL atau placeholder

    const tagClass = `tag-${categoryDisplay
      .toLowerCase()
      .replace(/[^a-z0-9]/gi, "-")}`;
    card.dataset.companyId = companyId; // Pastikan dataset menggunakan ID yang benar
    card.innerHTML = `
        <a href="#page-company-detail?id=${companyId}" class="card-link company-detail-link" data-companyid="${companyId}" aria-label="Lihat detail untuk ${name}">
            <div class="card-img-hovered" style="background-image: url('${imageUrl}');"></div>
        </a>
        <div class="card-info">
            <div class="card-about">
                <span class="card-tag ${tagClass}">${categoryDisplay}</span>
                <div class="card-time">${typeDisplay}</div>
            </div>
            <h3 class="card-title">${name}</h3>
            <div class="card-creator">${description}</div>
            <button class="btn btn-sm btn-primary btn-detail explore-btn-detail company-detail-link" data-companyid="${companyId}"><i class="fas fa-arrow-right"></i> Lihat Detail</button>
        </div>
    `;
    PageHome.companyGrid.appendChild(card);
  },

  // Fungsi-fungsi lain (seperti _populateRecommendationSwiper, renderRecommendationSlides, dll.) salin dari jawaban sebelumnya karena sudah benar
  _populateRecommendationSwiper: async () => {
    if (!PageHome.recommendationSwiperWrapper) return;
    if (window.sikmaApp?.isUserLoggedIn) {
      const profileResponse = await Api.getProfileData();
      if (profileResponse.status === "success" && profileResponse.data) {
        const userProfile = profileResponse.data;
        const userSkillsForML = [
          ...(userProfile.programmingSkill || []).map(
            (item) => item.skill_name
          ),
          ...(userProfile.framework || []).map((item) => item.framework_name),
          ...(userProfile.tool || []).map((item) => item.tool_name),
          ...(userProfile.industryPreference || []).map(
            (item) => item.industry_name
          ),
          ...(userProfile.education || []).map((item) => item.field_of_study),
        ]
          .filter(Boolean)
          .filter((v, i, a) => a.indexOf(v) === i);
        const recommendationsResponse = await Api.getRecommendations({
          skills: userSkillsForML,
        });
        if (
          recommendationsResponse.status === "success" &&
          recommendationsResponse.data?.length > 0
        ) {
          PageHome.renderRecommendationSlides(recommendationsResponse.data);
        } else {
          PageHome.showNoRecommendationsMessage(
            recommendationsResponse.message || "Belum ada rekomendasi cocok."
          );
        }
      } else {
        PageHome.showNoRecommendationsMessage(
          "Gagal memuat profil untuk rekomendasi."
        );
      }
    } else {
      const generalCompanies = (PageHome.allCompanyData || []).slice(0, 5);
      if (generalCompanies.length > 0) {
        PageHome.renderRecommendationSlides(generalCompanies);
      } else {
        PageHome.showNoRecommendationsMessage(
          "Login untuk melihat rekomendasi."
        );
      }
    }
  },

  renderRecommendationSlides: (companies) => {
    if (!PageHome.recommendationSwiperWrapper) return;
    PageHome.recommendationSwiperWrapper.innerHTML = "";
    if (PageHome.noRecommendationsMessage)
      UI.hideElement(PageHome.noRecommendationsMessage);
    companies.forEach((company) => {
      const matchScore = company.match_percentage
        ? `${company.match_percentage}%`
        : "N/A";
      // Perbaikan untuk nama perusahaan dan ID
      const companyId = company.id_perusahaan || company.id;
      const companyName = UI.escapeHTML(
        company.nama_perusahaan || company.name || "Nama Perusahaan"
      );
      const categoryDisplay = UI.escapeHTML(
        company.kategori_bidang || company.category || "Industri"
      );
      const description = UI.escapeHTML(
        company.deskripsi_singkat ||
          company.description ||
          "Deskripsi tidak tersedia."
      );

      const slide = document.createElement("div");
      slide.className = "swiper-slide card recommendation-card";
      let rawRecImageUrl = company.logo_url || company.imageUrl;
      if (
        typeof rawRecImageUrl !== "string" ||
        rawRecImageUrl.trim() === "" ||
        (!rawRecImageUrl.startsWith("http") &&
          !rawRecImageUrl.startsWith("data:"))
      ) {
        rawRecImageUrl = `https://placehold.co/400x240/EEE/888?text=${encodeURIComponent(
          companyName
        )}`;
      }
      // Tidak perlu UI.escapeHTML di sini karena rawRecImageUrl sudah dipastikan URL valid atau placeholder
      // dan akan digunakan langsung di style.backgroundImage.
      slide.style.backgroundImage = `url('${rawRecImageUrl}')`;
      slide.style.backgroundSize = "cover";
      slide.style.backgroundRepeat = "no-repeat";
      slide.style.backgroundPosition = "center";
      slide.dataset.companyid = company.id_perusahaan || company.id;
      slide.innerHTML = `
            <div class="card-overlay"></div>
            <div class="card-content">
                <h3>${companyName}</h3>
                <p class="card-subtitle">${categoryDisplay}</p>
                <div class="recommendation-details"> <p class="match-score"><strong>Kecocokan:</strong> <span class="score-value">${matchScore}</span></p> </div>
                <p class="card-description">${description}</p>
                <button class="btn btn-sm btn-primary btn-detail company-detail-link" data-companyid="${companyId}"><i class="fas fa-arrow-right"></i> Lihat Detail</button>
            </div> `;
      PageHome.recommendationSwiperWrapper.appendChild(slide);
    });
    PageHome._initSwiper();
  },

  showNoRecommendationsMessage: (message) => {
    if (PageHome.noRecommendationsMessage) {
      PageHome.noRecommendationsMessage.innerHTML = `<p><i class="fas fa-info-circle"></i> ${message}</p>`;
      UI.showElement(PageHome.noRecommendationsMessage, "block");
    }
  },
  _initSwiper: () => {
    if (
      PageHome.recommendationSwiperWrapper?.children.length > 0 &&
      typeof Swiper !== "undefined"
    ) {
      PageHome.recommendationSwiperInstance = new Swiper(
        PageHome.recommendationSwiperContainer,
        {
          slidesPerView: 1.2,
          spaceBetween: 15,
          loop: PageHome.recommendationSwiperWrapper.children.length > 2,
          autoplay: { delay: 4500, disableOnInteraction: false },
          pagination: { el: ".swiper-pagination", clickable: true },
          navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
          },
          breakpoints: {
            640: { slidesPerView: 1.8 },
            768: { slidesPerView: 2.2 },
            1024: { slidesPerView: 2.8 },
            1200: { slidesPerView: 3.2 },
          },
        }
      );
    }
  },
  _initCategoryFilter: () => {
    if (PageHome.companyCategoryFilter) {
      PageHome.companyCategoryFilter.addEventListener("change", function () {
        PageHome.filterCompanyGrid(this.value);
      });
    }
  },
  filterCompanyGrid: (selectedCategory) => {
    let visibleCount = 0;
    PageHome.allCompanyData.forEach((company) => {
      const card = PageHome.companyGrid.querySelector(
        `[data-company-id='${company.id}']`
      );
      if (card) {
        const isVisible =
          !selectedCategory ||
          (company.category &&
            company.category.toLowerCase() === selectedCategory.toLowerCase());
        card.style.display = isVisible ? "" : "none";
        if (isVisible) visibleCount++;
      }
    });
    if (visibleCount === 0 && selectedCategory)
      UI.showElement(PageHome.noCompanyResultsMessage, "block");
    else UI.hideElement(PageHome.noCompanyResultsMessage);
  },
  _initCompanyCardLinks: () => {
    if (PageHome.companyGrid) {
      PageHome.companyGrid.addEventListener("click", (event) => {
        const cardLink = event.target.closest(".company-detail-link");
        if (cardLink) {
          event.preventDefault();
          PageHome._navigateToCompanyDetail(cardLink.dataset.companyid);
        }
      });
    }
  },
  _navigateToCompanyDetail: (companyId) => {
    if (
      companyId &&
      typeof PageCompanyDetail !== "undefined" &&
      typeof AppCore !== "undefined"
    ) {
      AppCore.navigateToPage("page-company-detail", null, "Memuat Detail...");
      PageCompanyDetail.displayCompanyDetails(companyId);
    }
  },
};
