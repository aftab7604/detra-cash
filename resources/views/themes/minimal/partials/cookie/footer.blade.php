<style type="text/css">
    .custom-cookie-button {
        bottom: 30px;
        left: 30px;
        position: fixed;
        line-height: 40px;
        color: var(--natural-color);
        text-align: center;
        border-radius: 3px;
        cursor: pointer;
        z-index: 1000;
        -webkit-transition: .5s;
        transition: .5s;
    }
</style>
<button type="button" class="custom-cookie-button" data-cc="c-settings">
    <svg width="50px" height="50px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M7 12H17M8 8.5C8 8.5 9 9 10 9C11.5 9 12.5 8 14 8C15 8 16 8.5 16 8.5M8 15.5C8 15.5 9 16 10 16C11.5 16 12.5 15 14 15C15 15 16 15.5 16 15.5M21 12C21 16.9706 16.9706 21 12 21C7.02944 21 3 16.9706 3 12C3 7.02944 7.02944 3 12 3C16.9706 3 21 7.02944 21 12Z" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
    </svg>
</button>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orestbida/cookieconsent@v2.9.2/dist/cookieconsent.css">

<script defer src="https://cdn.jsdelivr.net/gh/orestbida/cookieconsent@v2.9.2/dist/cookieconsent.js"></script>
    <script>
        window.addEventListener('load', function() {

            // obtain plugin
            var cc = initCookieConsent();

            // run plugin with your configuration
            cc.run({
                current_lang: 'en',
                autoclear_cookies: true, // default: false
                page_scripts: true, // default: false

                // mode: 'opt-in'                          // default: 'opt-in'; value: 'opt-in' or 'opt-out'
                // delay: 0,                               // default: 0
                // auto_language: '',                      // default: null; could also be 'browser' or 'document'
                // autorun: true,                          // default: true
                force_consent: true,                   // default: false
                // hide_from_bots: true,                   // default: true
                // remove_cookie_tables: false             // default: false
                // cookie_name: 'cc_cookie',               // default: 'cc_cookie'
                // cookie_expiration: 182,                 // default: 182 (days)
                // cookie_necessary_only_expiration: 182   // default: disabled
                // cookie_domain: location.hostname,       // default: current domain
                // cookie_path: '/',                       // default: root
                // cookie_same_site: 'Lax',                // default: 'Lax'
                // use_rfc_cookie: false,                  // default: false
                // revision: 0,                            // default: 0

                onFirstAction: function(user_preferences, cookie) {
                    // callback triggered only once on the first accept/reject action
                },

                onAccept: function(cookie) {
                    // callback triggered on the first accept/reject action, and after each page load
                },

                onChange: function(cookie, changed_categories) {
                    // callback triggered when user changes preferences after consent has already been given
                },

                languages: {
                    'en': {
                        consent_modal: {
                            title: '@lang('We use cookies!')',
                            description: '@lang('Hi, this website uses essential cookies to ensure its proper operation and tracking cookies to understand how you interact with it. The latter will be set only after consent. <button type="button" data-cc="c-settings" class="cc-link">Let me choose</button>')',
                            primary_btn: {
                                text: '@lang('Accept all')',
                                role: 'accept_all' // 'accept_selected' or 'accept_all'
                            },
                            secondary_btn: {
                                text: '@lang('Reject all')',
                                role: 'accept_necessary' // 'settings' or 'accept_necessary'
                            }
                        },
                        settings_modal: {
                            title: '@lang('Cookie preferences')',
                            save_settings_btn: '@lang('Save settings')',
                            accept_all_btn: '@lang('Accept all')',
                            reject_all_btn: '@lang('Reject all')',
                            close_btn_label: '@lang('Close')',
                            // cookie_table_caption: 'Cookie list',
                            cookie_table_headers: [{
                                    col1: '@lang('Name')'
                                },
                                {
                                    col2: '@lang('Domain')'
                                },
                                {
                                    col3: '@lang('Expiration')'
                                },
                                {
                                    col4: '@lang('Description')'
                                }
                            ],
                            blocks: [{
                                title: '@lang('Cookie usage') 📢',
                                description: '@lang('I use cookies to ensure the basic functionalities of the website and to enhance your online experience. You can choose for each category to opt-in/out whenever you want. For more details relative to cookies and other sensitive data, please read the full') <a href="#" class="cc-link">@lang('privacy policy')</a>.'
                            }, {
                                title: '@lang('Strictly necessary cookies')',
                                description: '@lang('These cookies are essential for the proper functioning of my website. Without these cookies, the website would not work properly')',
                                toggle: {
                                    value: 'necessary',
                                    enabled: true,
                                    readonly: true // cookie categories with readonly=true are all treated as "necessary cookies"
                                }
                            }, {
                                title: '@lang('Performance and Analytics cookies')',
                                description: '@lang('These cookies allow the website to remember the choices you have made in the past')',
                                toggle: {
                                    value: 'analytics', // your cookie category
                                    enabled: false,
                                    readonly: false
                                },
                                cookie_table: [ // list of all expected cookies
                                    {
                                        col1: '^_ga', // match all cookies starting with "_ga"
                                        col2: 'google.com',
                                        col3: '2 years',
                                        col4: 'description ...',
                                        is_regex: true
                                    },
                                    {
                                        col1: '_gid',
                                        col2: 'google.com',
                                        col3: '1 day',
                                        col4: 'description ...',
                                    }
                                ]
                            }, {
                                title: '@lang('Advertisement and Targeting cookies')',
                                description: '@lang('These cookies collect information about how you use the website, which pages you visited and which links you clicked on. All of the data is anonymized and cannot be used to identify you')',
                                toggle: {
                                    value: 'targeting',
                                    enabled: false,
                                    readonly: false
                                }
                            }, {
                                title: '@lang('More information')',
                                description: '@lang('For any queries in relation to our policy on cookies and your choices, please') <a class="cc-link" href="/contact">@lang('contact us')</a>.',
                            }]
                        }
                    },
                }
            });
        });
    </script>