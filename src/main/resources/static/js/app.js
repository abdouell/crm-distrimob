/* ==========================================================================
   Pyramidev Mini CRM - Core JavaScript (SPA Logic, Auth, CRUD & Filters)
   ========================================================================== */

document.addEventListener('DOMContentLoaded', () => {
    // State management
    const state = {
        token: localStorage.getItem('crm_token'),
        user: JSON.parse(localStorage.getItem('crm_user')),
        currentView: 'dashboard',
        activeProspectId: null,
        filters: {
            search: '',
            status: '',
            activity_sector: '',
            ordering: '-created_at'
        }
    };

    // DOM Elements Cache
    const el = {
        loginScreen: document.getElementById('login-screen'),
        appScreen: document.getElementById('app-screen'),
        loginForm: document.getElementById('login-form'),
        loginEmail: document.getElementById('login-email'),
        loginPassword: document.getElementById('login-password'),
        loginError: document.getElementById('login-error'),
        loginErrorText: document.getElementById('login-error-text'),
        loginBtn: document.getElementById('login-btn'),
        
        logoutBtn: document.getElementById('logout-btn'),
        userDisplayName: document.getElementById('user-display-name'),
        userDisplayEmail: document.getElementById('user-display-email'),
        userAvatarInitials: document.getElementById('user-avatar-initials'),
        
        currentViewTitle: document.getElementById('current-view-title'),
        sidebarNav: document.querySelectorAll('.sidebar-nav li'),
        globalAddProspectBtn: document.getElementById('global-add-prospect-btn'),
        
        // Views
        viewDashboard: document.getElementById('view-dashboard'),
        viewProspectDetail: document.getElementById('view-prospect-detail'),
        
        // Stats
        statTotal: document.getElementById('stat-total'),
        statActive: document.getElementById('stat-active'),
        statSigned: document.getElementById('stat-signed'),
        statForgotten: document.getElementById('stat-forgotten'),
        
        // Filters
        filterSearch: document.getElementById('filter-search'),
        filterStatus: document.getElementById('filter-status'),
        filterSector: document.getElementById('filter-sector'),
        filterSort: document.getElementById('filter-sort'),
        
        // Table
        prospectsListBody: document.getElementById('prospects-list-body'),
        
        // Detail View Elements
        backToDashboardBtn: document.getElementById('back-to-dashboard-btn'),
        detProspectName: document.getElementById('det-prospect-name'),
        detProspectStatus: document.getElementById('det-prospect-status'),
        detProspectSector: document.getElementById('det-prospect-sector'),
        detProspectCity: document.getElementById('det-prospect-city'),
        detProspectPhone: document.getElementById('det-prospect-phone'),
        detProspectWebsite: document.getElementById('det-prospect-website'),
        detProspectSource: document.getElementById('det-prospect-source'),
        detProspectCreatedAt: document.getElementById('det-prospect-created-at'),
        detProspectOwner: document.getElementById('det-prospect-owner'),
        detProspectNotes: document.getElementById('det-prospect-notes'),
        editProspectBtn: document.getElementById('edit-prospect-btn'),
        deleteProspectBtn: document.getElementById('delete-prospect-btn'),
        
        contactsContainer: document.getElementById('contacts-container'),
        addContactBtn: document.getElementById('add-contact-btn'),
        
        interactionsTimeline: document.getElementById('interactions-timeline'),
        addInteractionBtn: document.getElementById('add-interaction-btn'),
        
        // Modals
        modalProspect: document.getElementById('modal-prospect'),
        prospectForm: document.getElementById('prospect-form'),
        prospectIdInput: document.getElementById('prospect-id'),
        prospectNameInput: document.getElementById('prospect-name'),
        prospectSectorInput: document.getElementById('prospect-sector'),
        prospectCityInput: document.getElementById('prospect-city'),
        prospectPhoneInput: document.getElementById('prospect-phone'),
        prospectWebsiteInput: document.getElementById('prospect-website'),
        prospectSourceInput: document.getElementById('prospect-source'),
        prospectStatusInput: document.getElementById('prospect-status'),
        prospectNotesInput: document.getElementById('prospect-notes'),
        prospectModalTitle: document.getElementById('prospect-modal-title'),
        
        modalContact: document.getElementById('modal-contact'),
        contactForm: document.getElementById('contact-form'),
        contactIdInput: document.getElementById('contact-id'),
        contactProspectIdInput: document.getElementById('contact-prospect-id'),
        contactFirstnameInput: document.getElementById('contact-firstname'),
        contactLastnameInput: document.getElementById('contact-lastname'),
        contactJobInput: document.getElementById('contact-job'),
        contactEmailInput: document.getElementById('contact-email'),
        contactPhoneInput: document.getElementById('contact-phone'),
        contactLinkedinInput: document.getElementById('contact-linkedin'),
        contactNotesInput: document.getElementById('contact-notes'),
        contactModalTitle: document.getElementById('contact-modal-title'),
        
        modalInteraction: document.getElementById('modal-interaction'),
        interactionForm: document.getElementById('interaction-form'),
        interactionIdInput: document.getElementById('interaction-id'),
        interactionProspectIdInput: document.getElementById('interaction-prospect-id'),
        interactionDateInput: document.getElementById('interaction-date'),
        interactionTypeInput: document.getElementById('interaction-type'),
        interactionNotesInput: document.getElementById('interaction-notes'),
        interactionModalTitle: document.getElementById('interaction-modal-title'),
        
        toastContainer: document.getElementById('toast-container')
    };

    // Interaction icons map
    const interactionIcons = {
        'appel': 'fa-solid fa-phone',
        'email': 'fa-solid fa-envelope',
        'WhatsApp': 'fa-brands fa-whatsapp',
        'RDV': 'fa-solid fa-handshake',
        'démo': 'fa-solid fa-desktop',
        'visite': 'fa-solid fa-map-pin',
        'LinkedIn': 'fa-brands fa-linkedin'
    };

    /* ==========================================================================
       UTILITIES & NOTIFICATIONS
       ========================================================================== */
    function showToast(message, type = 'success') {
        const toast = document.createElement('div');
        toast.className = `toast ${type}`;
        
        let icon = 'fa-solid fa-check-circle';
        if (type === 'error') icon = 'fa-solid fa-circle-exclamation';
        if (type === 'info') icon = 'fa-solid fa-info-circle';
        
        toast.innerHTML = `
            <i class="${icon}"></i>
            <span>${message}</span>
        `;
        
        el.toastContainer.appendChild(toast);
        
        // Remove toast after 4s
        setTimeout(() => {
            toast.style.animation = 'slideIn 0.3s cubic-bezier(0.16, 1, 0.3, 1) reverse forwards';
            setTimeout(() => toast.remove(), 300);
        }, 4000);
    }

    function formatDate(dateString) {
        if (!dateString) return 'Jamais contacté';
        const d = new Date(dateString);
        return d.toLocaleDateString('fr-FR', {
            day: '2-digit',
            month: 'short',
            year: 'numeric',
            hour: '2-digit',
            minute: '2-digit'
        });
    }

    function formatDateForInput(dateString) {
        if (!dateString) return '';
        const d = new Date(dateString);
        // Format to YYYY-MM-DDThh:mm
        const year = d.getFullYear();
        const month = String(d.getMonth() + 1).padStart(2, '0');
        const day = String(d.getDate()).padStart(2, '0');
        const hours = String(d.getHours()).padStart(2, '0');
        const minutes = String(d.getMinutes()).padStart(2, '0');
        return `${year}-${month}-${day}T${hours}:${minutes}`;
    }

    /* ==========================================================================
       API CLIENT WITH AUTH INTERCEPTOR
       ========================================================================== */
    async function apiFetch(endpoint, options = {}) {
        const url = `/api/${endpoint.replace(/^\//, '')}`;
        
        // Setup headers
        options.headers = options.headers || {};
        options.headers['Content-Type'] = 'application/json';
        
        if (state.token) {
            // Equivalent HTTP Interceptor adding JWT token
            options.headers['Authorization'] = `Bearer ${state.token}`;
        }

        try {
            const response = await fetch(url, options);
            
            // Handle HTTP 401 Unauthorized
            if (response.status === 401) {
                if (state.token) {
                    showToast('Votre session a expiré. Veuillez vous reconnecter.', 'error');
                    logout();
                }
                throw new Error('Non authentifié');
            }
            
            if (response.status === 204) return null;
            
            const data = await response.json();
            
            if (!response.ok) {
                throw new Error(data.error || data.detail || 'Une erreur est survenue.');
            }
            
            return data;
        } catch (error) {
            console.error(`Erreur API [${url}]:`, error);
            throw error;
        }
    }

    /* ==========================================================================
       AUTHENTICATION MANAGEMENT
       ========================================================================== */
    function login(email, password) {
        el.loginBtn.disabled = true;
        el.loginBtn.querySelector('span').innerText = 'Connexion...';
        
        apiFetch('auth/login', {
            method: 'POST',
            body: JSON.stringify({ email, password })
        })
        .then(data => {
            state.token = data.token;
            state.user = data.user;
            
            localStorage.setItem('crm_token', data.token);
            localStorage.setItem('crm_user', JSON.stringify(data.user));
            
            showToast(`Bienvenue, ${state.user.full_name} !`);
            el.loginError.classList.add('hidden');
            
            initApp();
        })
        .catch(err => {
            el.loginErrorText.innerText = err.message || 'Identifiants incorrects.';
            el.loginError.classList.remove('hidden');
        })
        .finally(() => {
            el.loginBtn.disabled = false;
            el.loginBtn.querySelector('span').innerText = 'Se connecter';
        });
    }

    function logout() {
        state.token = null;
        state.user = null;
        localStorage.removeItem('crm_token');
        localStorage.removeItem('crm_user');
        
        // Switch views
        el.appScreen.classList.add('hidden');
        el.loginScreen.classList.remove('hidden');
        
        // Reset forms
        el.loginEmail.value = '';
        el.loginPassword.value = '';
        el.loginError.classList.add('hidden');
    }

    /* ==========================================================================
       MODALS HELPER
       ========================================================================== */
    function openModal(modalEl) {
        modalEl.classList.add('active');
    }

    function closeModal(modalEl) {
        modalEl.classList.remove('active');
        // Reset forms in modal
        const form = modalEl.querySelector('form');
        if (form) form.reset();
    }

    // Modal close listeners
    document.querySelectorAll('[data-close-modal]').forEach(btn => {
        btn.addEventListener('click', () => {
            const modalId = btn.getAttribute('data-close-modal');
            closeModal(document.getElementById(modalId));
        });
    });

    // Close on overlay click
    document.querySelectorAll('.modal').forEach(modal => {
        modal.addEventListener('click', (e) => {
            if (e.target === modal) closeModal(modal);
        });
    });

    /* ==========================================================================
       UI RENDERING & CONTROLLERS
       ========================================================================== */
    
    // View Switcher (Router)
    function switchView(viewName, params = {}) {
        state.currentView = viewName;
        
        // Toggle view containers
        if (viewName === 'dashboard') {
            el.viewDashboard.classList.remove('hidden');
            el.viewProspectDetail.classList.add('hidden');
            el.currentViewTitle.innerText = 'Tableau de bord';
            el.sidebarNav.forEach(item => {
                if(item.getAttribute('data-view') === 'dashboard' || item.getAttribute('data-view') === 'prospects') {
                    item.classList.add('active');
                } else {
                    item.classList.remove('active');
                }
            });
            fetchProspects();
        } 
        else if (viewName === 'detail') {
            el.viewDashboard.classList.add('hidden');
            el.viewProspectDetail.classList.remove('hidden');
            el.sidebarNav.forEach(item => item.classList.remove('active'));
            
            if (params.id) {
                state.activeProspectId = params.id;
                fetchProspectDetail(params.id);
            }
        }
        
        // Update URL hash
        window.location.hash = viewName === 'detail' ? `detail?id=${params.id}` : viewName;
    }

    // Load URL Hash state
    function handleHashChange() {
        if (!state.token) return;
        
        const hash = window.location.hash.replace('#', '');
        if (hash.startsWith('detail?')) {
            const params = new URLSearchParams(hash.split('?')[1]);
            const id = params.get('id');
            if (id) switchView('detail', { id });
        } else if (hash === 'prospects' || hash === 'dashboard' || hash === '') {
            switchView('dashboard');
        }
    }

    // Dashboard Controller: Fetch Prospects list with active filters
    async function fetchProspects() {
        el.prospectsListBody.innerHTML = `
            <tr>
                <td colspan="7" class="text-center table-loading">
                    <i class="fa-solid fa-spinner fa-spin"></i> Chargement des prospects...
                </td>
            </tr>
        `;

        try {
            // Build query params
            const queryParams = new URLSearchParams();
            if (state.filters.search) queryParams.append('search', state.filters.search);
            if (state.filters.status) queryParams.append('status', state.filters.status);
            if (state.filters.activity_sector) queryParams.append('activity_sector', state.filters.activity_sector);
            queryParams.append('ordering', state.filters.ordering);

            const prospects = await apiFetch(`prospects?${queryParams.toString()}`);
            
            // Calculate stats
            renderStats(prospects);
            
            // Render Table
            renderProspectsTable(prospects);
        } catch (err) {
            showToast('Impossible de charger les prospects.', 'error');
        }
    }

    // Calculate and render stats banner
    function renderStats(prospects) {
        const total = prospects.length;
        
        // Prospects en cours de discussion (tout sauf 'nouveau', 'client signé' et 'perdu')
        const active = prospects.filter(p => !['nouveau', 'client signé', 'perdu'].includes(p.status)).length;
        
        const signed = prospects.filter(p => p.status === 'client signé').length;
        
        // Prospects oubliés: pas d'interaction du tout, ou dernière interaction plus vieille de 30 jours
        const limitDate = new Date();
        limitDate.setDate(limitDate.getDate() - 30);
        const forgotten = prospects.filter(p => {
            if (!p.last_interaction_at) return true;
            return new Date(p.last_interaction_at) < limitDate;
        }).length;

        el.statTotal.innerText = total;
        el.statActive.innerText = active;
        el.statSigned.innerText = signed;
        el.statForgotten.innerText = forgotten;
    }

    // Render table rows
    function renderProspectsTable(prospects) {
        if (prospects.length === 0) {
            el.prospectsListBody.innerHTML = `
                <tr>
                    <td colspan="7" class="text-center table-empty">
                        <i class="fa-solid fa-folder-open"></i> Aucun prospect trouvé.
                    </td>
                </tr>
            `;
            return;
        }

        let html = '';
        prospects.forEach(p => {
            const lastInteractionText = p.last_interaction_at 
                ? formatDate(p.last_interaction_at) 
                : '<span class="text-forgotten"><i class="fa-solid fa-triangle-exclamation"></i> Jamais contacté</span>';
            
            // Status class for badges
            const statusClass = p.status.replace(' ', '-');
            
            html += `
                <tr>
                    <td><strong>${escapeHtml(p.name)}</strong></td>
                    <td><span class="badge badge-outline">${p.activity_sector}</span></td>
                    <td>${escapeHtml(p.city)}</td>
                    <td><span class="badge badge-status-${statusClass}">${p.status}</span></td>
                    <td>${escapeHtml(p.owner_name)}</td>
                    <td>${lastInteractionText}</td>
                    <td class="text-right">
                        <div class="actions-cell">
                            <button class="btn-icon view-btn" data-id="${p.id}" title="Voir les détails">
                                <i class="fa-solid fa-eye"></i>
                            </button>
                            <button class="btn-icon edit-btn" data-id="${p.id}" title="Modifier">
                                <i class="fa-solid fa-pen"></i>
                            </button>
                            <button class="btn-icon delete-btn" data-id="${p.id}" title="Supprimer">
                                <i class="fa-solid fa-trash"></i>
                            </button>
                        </div>
                    </td>
                </tr>
            `;
        });
        
        el.prospectsListBody.innerHTML = html;

        // Attach action listeners
        el.prospectsListBody.querySelectorAll('.view-btn').forEach(btn => {
            btn.addEventListener('click', () => switchView('detail', { id: btn.getAttribute('data-id') }));
        });
        
        el.prospectsListBody.querySelectorAll('.edit-btn').forEach(btn => {
            btn.addEventListener('click', () => openProspectForm(btn.getAttribute('data-id')));
        });
        
        el.prospectsListBody.querySelectorAll('.delete-btn').forEach(btn => {
            btn.addEventListener('click', () => deleteProspect(btn.getAttribute('data-id')));
        });
    }

    // Prospect Detail Controller: Fetch detailed profile + contacts + interactions
    async function fetchProspectDetail(id) {
        try {
            const p = await apiFetch(`prospects/${id}`);
            
            // Set header title
            el.currentViewTitle.innerText = `${p.name} • Détails`;
            
            // Populate profile fields
            el.detProspectName.innerText = p.name;
            el.detProspectStatus.innerText = p.status;
            el.detProspectStatus.className = `badge badge-status-${p.status.replace(' ', '-')}`;
            el.detProspectSector.innerText = p.activity_sector;
            el.detProspectCity.innerText = p.city;
            el.detProspectPhone.innerText = p.phone;
            el.detProspectWebsite.innerHTML = p.website ? `<a href="${p.website}" target="_blank" rel="noopener">${p.website} <i class="fa-solid fa-up-right-from-square"></i></a>` : '-';
            el.detProspectSource.innerText = p.source;
            el.detProspectCreatedAt.innerText = new Date(p.created_at).toLocaleDateString('fr-FR');
            el.detProspectOwner.innerText = p.owner_name;
            el.detProspectNotes.innerText = p.notes || 'Aucune note pour ce prospect.';
            
            // Set up form button IDs
            el.editProspectBtn.setAttribute('data-id', p.id);
            el.deleteProspectBtn.setAttribute('data-id', p.id);
            
            // Render contacts
            renderContacts(p.contacts, p.id);
            
            // Render interactions timeline
            renderInteractions(p.interactions, p.id);
            
        } catch (err) {
            showToast('Erreur lors du chargement des détails.', 'error');
            switchView('dashboard');
        }
    }

    function renderContacts(contacts, prospectId) {
        el.contactsContainer.innerHTML = '';
        
        if (contacts.length === 0) {
            el.contactsContainer.innerHTML = `
                <div class="table-empty text-center col-12" style="width:100%; grid-column: 1 / -1; padding: 20px;">
                    <i class="fa-solid fa-address-card" style="font-size: 1.5rem; margin-bottom: 8px;"></i>
                    <p>Aucun interlocuteur enregistré pour cette entreprise.</p>
                </div>
            `;
            return;
        }

        contacts.forEach(c => {
            const card = document.createElement('div');
            card.className = 'contact-card';
            
            let linkedinHTML = '';
            if (c.linkedin_url) {
                linkedinHTML = `
                    <a href="${c.linkedin_url}" target="_blank" rel="noopener" class="text-secondary">
                        <i class="fa-brands fa-linkedin" style="color: #0077b5;"></i> Profil LinkedIn
                    </a>
                `;
            }
            
            let notesHTML = '';
            if (c.notes) {
                notesHTML = `
                    <div class="contact-notes-area">
                        <strong>Note :</strong> ${escapeHtml(c.notes)}
                    </div>
                `;
            }
            
            card.innerHTML = `
                <div class="contact-header">
                    <div>
                        <div class="contact-name">${escapeHtml(c.first_name)} ${escapeHtml(c.last_name)}</div>
                        <div class="contact-job">${escapeHtml(c.job_title)}</div>
                    </div>
                    <div class="contact-card-actions">
                        <button class="btn-icon edit-contact-btn" data-id="${c.id}" title="Modifier"><i class="fa-solid fa-pencil"></i></button>
                        <button class="btn-icon delete-contact-btn" data-id="${c.id}" title="Supprimer"><i class="fa-solid fa-trash"></i></button>
                    </div>
                </div>
                <div class="contact-body">
                    <a href="mailto:${c.email}"><i class="fa-solid fa-envelope"></i> ${escapeHtml(c.email)}</a>
                    <a href="tel:${c.phone}"><i class="fa-solid fa-mobile-screen-button"></i> ${escapeHtml(c.phone)}</a>
                    ${linkedinHTML}
                </div>
                ${notesHTML}
            `;
            
            // Attach events
            card.querySelector('.edit-contact-btn').addEventListener('click', () => openContactForm(prospectId, c.id, c));
            card.querySelector('.delete-contact-btn').addEventListener('click', () => deleteContact(prospectId, c.id));
            
            el.contactsContainer.appendChild(card);
        });
    }

    function renderInteractions(interactions, prospectId) {
        el.interactionsTimeline.innerHTML = '';
        
        if (interactions.length === 0) {
            el.interactionsTimeline.innerHTML = `
                <div class="table-empty text-center" style="padding: 20px;">
                    <i class="fa-solid fa-clock" style="font-size: 1.5rem; margin-bottom: 8px;"></i>
                    <p>Aucun échange consigné pour l'instant.</p>
                </div>
            `;
            return;
        }

        // Sort by date descending
        interactions.sort((a,b) => new Date(b.date) - new Date(a.date));

        interactions.forEach(i => {
            const item = document.createElement('div');
            item.className = 'timeline-item';
            item.setAttribute('data-type', i.type);
            
            const iconClass = interactionIcons[i.type] || 'fa-solid fa-comment';
            
            item.innerHTML = `
                <div class="timeline-icon">
                    <i class="${iconClass}"></i>
                </div>
                <div class="timeline-content">
                    <div class="timeline-header">
                        <span class="timeline-type">${i.type}</span>
                        <span class="timeline-date">${formatDate(i.date)}</span>
                    </div>
                    <p class="timeline-notes">${escapeHtml(i.notes)}</p>
                    <div class="timeline-actions">
                        <button class="btn btn-secondary btn-sm edit-interaction-btn" data-id="${i.id}"><i class="fa-solid fa-pencil"></i> Modifier</button>
                        <button class="btn btn-danger btn-sm delete-interaction-btn" data-id="${i.id}"><i class="fa-solid fa-trash"></i> Supprimer</button>
                    </div>
                </div>
            `;
            
            // Attach events
            item.querySelector('.edit-interaction-btn').addEventListener('click', () => openInteractionForm(prospectId, i.id, i));
            item.querySelector('.delete-interaction-btn').addEventListener('click', () => deleteInteraction(prospectId, i.id));
            
            el.interactionsTimeline.appendChild(item);
        });
    }

    /* ==========================================================================
       CRUD OPERATIONS & FORM HANDLERS
       ========================================================================== */
    
    // PROSPECT
    function openProspectForm(id = null) {
        if (id) {
            // Edit mode
            el.prospectModalTitle.innerText = "Modifier le Prospect";
            apiFetch(`prospects/${id}`)
                .then(p => {
                    el.prospectIdInput.value = p.id;
                    el.prospectNameInput.value = p.name;
                    el.prospectSectorInput.value = p.activity_sector;
                    el.prospectCityInput.value = p.city;
                    el.prospectPhoneInput.value = p.phone;
                    el.prospectWebsiteInput.value = p.website || '';
                    el.prospectSourceInput.value = p.source;
                    el.prospectStatusInput.value = p.status;
                    el.prospectNotesInput.value = p.notes || '';
                    openModal(el.modalProspect);
                })
                .catch(() => showToast('Erreur lors de la récupération des données.', 'error'));
        } else {
            // Create mode
            el.prospectModalTitle.innerText = "Nouveau Prospect";
            el.prospectIdInput.value = '';
            el.prospectForm.reset();
            // Default status
            el.prospectStatusInput.value = 'nouveau';
            openModal(el.modalProspect);
        }
    }

    el.prospectForm.addEventListener('submit', (e) => {
        e.preventDefault();
        
        const id = el.prospectIdInput.value;
        const payload = {
            name: el.prospectNameInput.value,
            activity_sector: el.prospectSectorInput.value,
            city: el.prospectCityInput.value,
            phone: el.prospectPhoneInput.value,
            website: el.prospectWebsiteInput.value || null,
            source: el.prospectSourceInput.value,
            status: el.prospectStatusInput.value,
            notes: el.prospectNotesInput.value || null
        };

        const method = id ? 'PUT' : 'POST';
        const endpoint = id ? `prospects/${id}` : 'prospects';

        apiFetch(endpoint, {
            method: method,
            body: JSON.stringify(payload)
        })
        .then(() => {
            showToast(id ? 'Prospect mis à jour.' : 'Prospect enregistré.');
            closeModal(el.modalProspect);
            
            if (state.currentView === 'detail' && id) {
                fetchProspectDetail(id);
            } else {
                switchView('dashboard');
            }
        })
        .catch(err => showToast(err.message, 'error'));
    });

    async function deleteProspect(id) {
        if (!confirm('Êtes-vous sûr de vouloir supprimer ce prospect définitivement ? Cela effacera également tous ses contacts et interactions.')) return;
        
        try {
            await apiFetch(`prospects/${id}`, { method: 'DELETE' });
            showToast('Prospect supprimé avec succès.');
            
            if (state.currentView === 'detail') {
                switchView('dashboard');
            } else {
                fetchProspects();
            }
        } catch (err) {
            showToast('Erreur lors de la suppression.', 'error');
        }
    }

    // CONTACTS
    function openContactForm(prospectId, id = null, data = null) {
        el.contactProspectIdInput.value = prospectId;
        
        if (id && data) {
            el.contactModalTitle.innerText = "Modifier le Contact";
            el.contactIdInput.value = id;
            el.contactFirstnameInput.value = data.first_name;
            el.contactLastnameInput.value = data.last_name;
            el.contactJobInput.value = data.job_title;
            el.contactEmailInput.value = data.email;
            el.contactPhoneInput.value = data.phone;
            el.contactLinkedinInput.value = data.linkedin_url || '';
            el.contactNotesInput.value = data.notes || '';
        } else {
            el.contactModalTitle.innerText = "Ajouter un Contact";
            el.contactIdInput.value = '';
            el.contactForm.reset();
            el.contactProspectIdInput.value = prospectId;
        }
        
        openModal(el.modalContact);
    }

    el.contactForm.addEventListener('submit', (e) => {
        e.preventDefault();
        
        const prospectId = el.contactProspectIdInput.value;
        const id = el.contactIdInput.value;
        const payload = {
            prospect: parseInt(prospectId),
            first_name: el.contactFirstnameInput.value,
            last_name: el.contactLastnameInput.value,
            job_title: el.contactJobInput.value,
            email: el.contactEmailInput.value,
            phone: el.contactPhoneInput.value,
            linkedin_url: el.contactLinkedinInput.value || null,
            notes: el.contactNotesInput.value || null
        };

        const method = id ? 'PUT' : 'POST';
        const endpoint = id ? `contacts/${id}` : 'contacts';

        apiFetch(endpoint, {
            method: method,
            body: JSON.stringify(payload)
        })
        .then(() => {
            showToast(id ? 'Contact mis à jour.' : 'Contact ajouté.');
            closeModal(el.modalContact);
            fetchProspectDetail(prospectId);
        })
        .catch(err => showToast(err.message, 'error'));
    });

    async function deleteContact(prospectId, id) {
        if (!confirm('Supprimer ce contact ?')) return;
        
        try {
            await apiFetch(`contacts/${id}`, { method: 'DELETE' });
            showToast('Contact supprimé.');
            fetchProspectDetail(prospectId);
        } catch (err) {
            showToast('Erreur lors de la suppression.', 'error');
        }
    }

    // INTERACTIONS
    function openInteractionForm(prospectId, id = null, data = null) {
        el.interactionProspectIdInput.value = prospectId;
        
        if (id && data) {
            el.interactionModalTitle.innerText = "Modifier l'échange";
            el.interactionIdInput.value = id;
            el.interactionDateInput.value = formatDateForInput(data.date);
            el.interactionTypeInput.value = data.type;
            el.interactionNotesInput.value = data.notes;
        } else {
            el.interactionModalTitle.innerText = "Consigner un échange";
            el.interactionIdInput.value = '';
            el.interactionForm.reset();
            el.interactionProspectIdInput.value = prospectId;
            // Pre-fill date with current date/time local
            const now = new Date();
            el.interactionDateInput.value = formatDateForInput(now);
        }
        
        openModal(el.modalInteraction);
    }

    el.interactionForm.addEventListener('submit', (e) => {
        e.preventDefault();
        
        const prospectId = el.interactionProspectIdInput.value;
        const id = el.interactionIdInput.value;
        
        // Parse date to ISO string
        const dateInput = el.interactionDateInput.value;
        const isoDate = new Date(dateInput).toISOString();

        const payload = {
            prospect: parseInt(prospectId),
            date: isoDate,
            type: el.interactionTypeInput.value,
            notes: el.interactionNotesInput.value
        };

        const method = id ? 'PUT' : 'POST';
        const endpoint = id ? `interactions/${id}` : 'interactions';

        apiFetch(endpoint, {
            method: method,
            body: JSON.stringify(payload)
        })
        .then(() => {
            showToast(id ? 'Échange modifié.' : 'Échange consigné.');
            closeModal(el.modalInteraction);
            fetchProspectDetail(prospectId);
        })
        .catch(err => showToast(err.message, 'error'));
    });

    async function deleteInteraction(prospectId, id) {
        if (!confirm('Supprimer cet historique d\'échange ? La date de dernière interaction du prospect sera recalculée.')) return;
        
        try {
            await apiFetch(`interactions/${id}`, { method: 'DELETE' });
            showToast('Échange supprimé.');
            fetchProspectDetail(prospectId);
        } catch (err) {
            showToast('Erreur lors de la suppression.', 'error');
        }
    }

    /* ==========================================================================
       GLOBAL EVENT LISTENERS
       ========================================================================== */
    
    // Login Submission
    el.loginForm.addEventListener('submit', (e) => {
        e.preventDefault();
        login(el.loginEmail.value, el.loginPassword.value);
    });

    // Logout Click
    el.logoutBtn.addEventListener('click', () => {
        if (confirm('Voulez-vous vous déconnecter ?')) logout();
    });

    // Sidebar navigation clicks
    el.sidebarNav.forEach(item => {
        item.addEventListener('click', (e) => {
            const view = item.getAttribute('data-view');
            if (view) {
                e.preventDefault();
                switchView('dashboard'); // Both views route to dashboard/list
            }
        });
    });

    // Back to dashboard details link
    el.backToDashboardBtn.addEventListener('click', () => switchView('dashboard'));

    // Form open actions
    el.globalAddProspectBtn.addEventListener('click', () => openProspectForm());
    el.addContactBtn.addEventListener('click', () => {
        if (state.activeProspectId) openContactForm(state.activeProspectId);
    });
    el.addInteractionBtn.addEventListener('click', () => {
        if (state.activeProspectId) openInteractionForm(state.activeProspectId);
    });

    // Detail page edit/delete
    el.editProspectBtn.addEventListener('click', () => {
        const id = el.editProspectBtn.getAttribute('data-id');
        if (id) openProspectForm(id);
    });
    el.deleteProspectBtn.addEventListener('click', () => {
        const id = el.deleteProspectBtn.getAttribute('data-id');
        if (id) deleteProspect(id);
    });

    // Real-time Filters and Search
    el.filterSearch.addEventListener('input', debounce(() => {
        state.filters.search = el.filterSearch.value;
        fetchProspects();
    }, 300));

    el.filterStatus.addEventListener('change', () => {
        state.filters.status = el.filterStatus.value;
        fetchProspects();
    });

    el.filterSector.addEventListener('change', () => {
        state.filters.activity_sector = el.filterSector.value;
        fetchProspects();
    });

    el.filterSort.addEventListener('change', () => {
        state.filters.ordering = el.filterSort.value;
        fetchProspects();
    });

    // Debounce function for searching
    function debounce(func, wait) {
        let timeout;
        return function executedFunction(...args) {
            const later = () => {
                clearTimeout(timeout);
                func(...args);
            };
            clearTimeout(timeout);
            timeout = setTimeout(later, wait);
        };
    }

    // HTML escape utility to prevent XSS
    function escapeHtml(string) {
        const map = {
            '&': '&amp;',
            '<': '&lt;',
            '>': '&gt;',
            '"': '&quot;',
            "'": '&#039;'
        };
        if(!string) return '';
        return string.toString().replace(/[&<>"']/g, function(m) { return map[m]; });
    }

    // Listen to hash changes for browser back/forward buttons
    window.addEventListener('hashchange', handleHashChange);

    /* ==========================================================================
       APP INITIALIZATION
       ========================================================================== */
    function initApp() {
        // Authenticated states
        el.loginScreen.classList.add('hidden');
        el.appScreen.classList.remove('hidden');
        
        // Set user profile info in UI
        el.userDisplayName.innerText = state.user.full_name;
        el.userDisplayEmail.innerText = state.user.email;
        
        // Initials avatar
        const parts = state.user.full_name.split(' ');
        const initials = parts.map(p => p[0]).join('').substring(0, 2).toUpperCase();
        el.userAvatarInitials.innerText = initials || 'US';

        // Load correct view based on URL hash or default to dashboard
        handleHashChange();
        if (!window.location.hash) {
            switchView('dashboard');
        }
    }

    // Startup check
    if (state.token && state.user) {
        initApp();
    } else {
        logout();
    }
});
