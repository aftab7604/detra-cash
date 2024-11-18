<?php

$arr = [
     'dashboard' => [
        'label' => "Dashboard",
        'access' => [
            'view' => ['admin.dashboard'],
            'add' => [],
            'edit' => [],
            'delete' => [],
        ],
    ],
    'manage_staff' =>[
        'label' => "Manage Staff",
        'access' => [
            'view' => ['admin.staff'],
            'add' => ['admin.storeStaff'],
            'edit' => ['admin.updateStaff'],
            'delete' => [],
        ],
    ],
    'manage_role' =>[
        'label' => "Manage Role & Permission",
        'access' => [
            'view' => ['admin.roles'],
            'add' => ['admin.storeRole'],
            'edit' => ['admin.updateRole'],
            'delete' => [],
        ],
    ],
    'staff_activity_log' =>[
        'label' => "Staff Activity Log",
        'access' => [
            'view' => ['admin.activityLog'],
            'add' => [],
            'edit' => [],
            'delete' => [],
        ],
    ],
    'staff_loggedin_log' =>[
        'label' => "Staff Login Log",
        'access' => [
            'view' => ['admin.loggedIn'],
            'add' => [],
            'edit' => [],
            'delete' => [],
        ],
    ],
    'identify_form' =>[
        'label' => "Identity Form",
        'access' => [
            'view' => ['admin.identify-form'],
            'add' => ['admin.identify-form.store'],
            'edit' => ['admin.identify-form.store'],
            'delete' => [],
        ],
    ],
    'service_list' => [
        'label' => "Service List",
        'access' => [
            'view' => [
                'admin.service'
            ],
            'add' => [
                'admin.service.add',
                'admin.service.store'
            ],
            'edit' => [
                'admin.service.edit',
                'admin.service.update'
            ],
            'delete' => []
        ],
    ],
    'service_info' => [
        'label' => "Service Info",
        'access' => [
            'view' => [
                'admin.serviceinfo.index'
            ],
            'add' => [
                'admin.serviceinfo.create',
                'admin.serviceinfo.store'
            ],
            'edit' => [
                'admin.serviceinfo.edit',
                'admin.serviceinfo.update'
            ],
            'delete' => [
                'admin.serviceinfo.destroy'
            ]
        ],
    ],
    'continent_list' => [
        'label' => "Continent List",
        'access' => [
            'view' => [
                'admin.continent'
            ],
            'add' => [
                'admin.store.continent'
            ],
            'edit' => [
                'admin.update.continent'
            ],
            'delete' => [
                'admin.delete.continent'
            ]
        ]
    ],
    'country_list' => [
        'label' => "Country List",
        'access' => [
            'view' => [
                'admin.country'
            ],
            'add' => [
                'admin.country.create',
                'admin.country.store'
            ],
            'edit' => [
                'admin.country.edit',
                'admin.country.update',
                'admin.country.multiple-active',
                'admin.country.multiple-inactive',
            ],
            'delete' => []
        ]
    ],
    'country_limit' => [
        'label' => "Country Limit",
        'access' => [
            'view' => [
                'admin.country.limit'
            ],
            'add' => [],
            'edit' => [
                'admin.country.limit.update'
            ],
            'delete' => []
        ]
    ],
    'country_service' => [
        'label' => "Country Service",
        'access' => [
            'view' => [
                'admin.country.service',
            ],
            'add' => [
                'admin.country.service.store'
            ],
            'edit' => [
                'admin.country.service.update'
            ],
            'delete' => []
        ]
    ],
    'country_service_charge' => [
        'label' => "Country Service Charge",
        'access' => [
            'view' => [
                'admin.country.service.charge'
            ],
            'add' => [
                'admin.country.service.charge.store'
            ],
            'edit' => [],
            'delete' => []
        ]
    ],
    'purpose_list' => [
        'label' => "Purpose List",
        'access' => [
            'view' => [
                'admin.purpose'
            ],
            'add' => [
                'admin.purpose.add',
            ],
            'edit' => [
                'admin.purpose.edit',
                'admin.purpose.update'
            ],
            'delete' => [
                'admin.purpose.delete'
            ]
        ]
    ],
    'source_fund' => [
        'label' => "Source Of Fund",
        'access' => [
            'view' => [
                'admin.sourceOfFund'
            ],
            'add' => [
                'admin.sourceOfFund.add',
                'admin.sourceOfFund.store'
            ],
            'edit' => [
                'admin.sourceOfFund.edit',
                'admin.sourceOfFund.update'
            ],
            'delete' => [
                'admin.sourceOfFund.delete'
            ]
        ]
    ],
    'manage_coupon' => [
        'label' => "Manage Coupon",
        'access' => [
            'view' => [
                'admin.coupon',
                ],
            'add' => [
                'admin.coupon.store',
            ],
            'edit' => [],
            'delete' => [],
        ],
    ],
    'manage_coupon_used' => [
        'label' => "Manage Coupon Used",
        'access' => [
            'view' => [
                'admin.coupon.used',
                ],
            'add' => [],
            'edit' => [],
            'delete' => [],
        ],
    ],
    'remittance_history' => [
        'label' => "Remittance History",
        'access' => [
            'view' => [
                'admin.money-transfer',
                'admin.money-transfer.search',
                'admin.money-transfer.details',
            ],
            'add' => [],
            'edit' => [
                'admin.money-transfer.action'
            ],
            'delete' => [],
        ],
    ],
    'remittance_history_complete' => [
        'label' => "Remittance History - Complete",
        'access' => [
            'view' => [
                'admin.money-transfer.complete',
            ],
            'add' => [],
            'edit' => [],
            'delete' => [],
        ],
    ],
    'remittance_history_pending' => [
        'label' => "Remittance History - Pending",
        'access' => [
            'view' => [
                'admin.money-transfer.pending',
            ],
            'add' => [],
            'edit' => [],
            'delete' => [],
        ],
    ],
    'remittance_history_cancelled' => [
        'label' => "Remittance History - Cancelled",
        'access' => [
            'view' => [
                'admin.money-transfer.cancelled',
            ],
            'add' => [],
            'edit' => [],
            'delete' => [],
        ],
    ],
    'remittance_history_pending_recharge' => [
        'label' => "Remittance History - Pending Recharge",
        'access' => [
            'view' => [
                'admin.money-transfer.recharge.pending',
            ],
            'add' => [],
            'edit' => [],
            'delete' => [],
        ],
    ],
    'withdraw_history' => [
        'label' => "Withdraw History",
        'access' => [
            'view' => [
                'admin.withdraw-history',
            ],
            'add' => [],
            'edit' => [],
            'delete' => [],
        ],
    ],
    'payout_history' => [
        'label' => "Payout History",
        'access' => [
            'view' => [
                'admin.payout.History',
            ],
            'add' => [],
            'edit' => [],
            'delete' => [],
        ],
    ],
    'payment_method' => [
        'label' => "Payment Method",
        'access' => [
            'view' => [
                'admin.payment.methods',
            ],
            'add' => [],
            'edit' => [
                'admin.edit.payment.methods',
                'admin.update.payment.methods'
            ],
            'delete' => [],
        ],
    ],
    'payment_gateway' => [
        'label' => "Payment Gateway",
        'access' => [
            'view' => [
                'admin.deposit.manual.index',
				'admin.deposit.manual.create'
            ],
            'add' => ['admin.deposit.manual.store'],
            'edit' => [
                'admin.deposit.manual.edit'
            ],
            'delete' => [],
        ],
    ],
    'payment_log' => [
        'label' => "Payment Log",
        'access' => [
            'view' => [
                'admin.payment.log',
            ],
            'add' => [],
            'edit' => [
                'admin.payment.action'
            ],
            'delete' => [],
        ],
    ],
    'payment_log_pending' => [
        'label' => "Payment Request",
        'access' => [
            'view' => [
                'admin.payment.pending',
            ],
            'add' => [],
            'edit' => [
                'admin.payment.action'
            ],
            'delete' => [],
        ],
    ],
    'payment_log_report' => [
        'label' => "Payment Log Report",
        'access' => [
            'view' => [
                'admin.payment.reportlog',
            ],
            'add' => [],
            'edit' => [
                'admin.payment.action'
            ],
            'delete' => [],
        ],
    ],
    'payment_search' => [
        'label' => "Payment Search",
        'access' => [
            'view' => [
                'admin.payment.search',
            ],
            'add' => [],
            'edit' => [],
            'delete' => [],
        ],
    ],

    'user_management' => [
        'label' => "User Management",
        'access' => [
            'view' => [
                'admin.users',
                'admin.users.search',
                'admin.user.transaction',
                'admin.user.fundLog',
                'admin.user.transfer',
                'admin.user.loggedIn',
            ],
            'add' => [],
            'edit' => [
                'admin.user-multiple-active',
                'admin.user-multiple-inactive',
                'admin.user-edit',
            ],
            'delete' => [],
        ],
    ],
    'add_merchant' => [
        'label' => "Add Merchants",
        'access' => [
            'view' => [],
            'add' => [
                'admin.merchants.create'
            ],
            'edit' => [],
            'delete' => []
        ]
    ],
    'merchants' => [
        'label' => "Merchants",
        'access' => [
            'view' => [
                'admin.merchants',
                'admin.merchants.search',
            ],
            'add' => [],
            'edit' => [],
            'delete' => []
        ]
    ],
    'email_send' => [
        'label' => "Email Send",
        'access' => [
            'view' => [
                'admin.email-send',
            ],
            'add' => [],
            'edit' => [
                'admin.send-email',
            ],
            'delete' => []
        ]
    ],
    'kyc_pending' => [
        'label' => "KYC Pending",
        'access' => [
            'view' => [
                'admin.users.kyc.pending',
            ],
            'add' => [],
            'edit' => [],
            'delete' => []
        ]
    ],
    'kyc_log' => [
        'label' => "KYC Log",
        'access' => [
            'view' => [
                'admin.users.kyc',
            ],
            'add' => [],
            'edit' => [],
            'delete' => []
        ]
    ],
    'loggedin_log' => [
        'label' => "LoggedIn Log",
        'access' => [
            'view' => [
                'admin.users.loggedIn',
            ],
            'add' => [],
            'edit' => [],
            'delete' => []
        ]
    ],
    'activity_log' => [
        'label' => "Activity Log",
        'access' => [
            'view' => [
                'admin.users.activityLog',
            ],
            'add' => [],
            'edit' => [],
            'delete' => []
        ]
    ],
    'transaction' => [
        'label' => "Transaction",
        'access' => [
            'view' => [
                'admin.transaction',
                'admin.transaction.search'
            ],
            'add' => [],
            'edit' => [],
            'delete' => [],
        ],
    ],
    'support_ticket' => [
        'label' => "Support Ticket",
        'access' => [
            'view' => [
                'admin.ticket',
            ],
            'add' => [
                'admin.ticket.reply'
            ],
            'edit' => [],
            'delete' => [
                'admin.ticket.delete',
            ],
        ],
    ],
    'support_open_ticket' => [
        'label' => "Support Open Ticket",
        'access' => [
            'view' => [
                'admin.ticket.open',
            ],
            'add' => [],
            'edit' => [],
            'delete' => [],
        ],
    ],
    'support_closed_ticket' => [
        'label' => "Support Closed Ticket",
        'access' => [
            'view' => [
                'admin.ticket.closed',
            ],
            'add' => [],
            'edit' => [],
            'delete' => [],
        ],
    ],
    'support_answered_ticket' => [
        'label' => "Support Answered Ticket",
        'access' => [
            'view' => [
                'admin.ticket.answered',
            ],
            'add' => [],
            'edit' => [],
            'delete' => [],
        ],
    ],
    'support_ticket_detail' => [
            'label' => "Support Ticket Detail",
            'access' => [
                'view' => [
                    'admin.ticket.view',
                ],
                'add' => [],
                'edit' => [],
                'delete' => [],
            ],
        ],
    'subscriber' => [
        'label' => "Subscriber",
        'access' => [
            'view' => [
                'admin.subscriber.index',
                'admin.subscriber.sendEmail',
            ],
            'add' => [],
            'edit' => [],
            'delete' => [
                'admin.subscriber.remove'
            ],
        ],
    ],

    'our_futures' => [
        'label' => "Out Futures",
        'access' => [
            'view' => [
                'admin.ourFuture.index'
            ],
            'add' => [],
            'edit' => [],
            'delete' => [
                'admin.ourFuture.remove'
            ],
        ],
    ],

    'website_controls' => [
        'label' => "Website Controls",
        'access' => [
            'view' => [
                'admin.basic-controls',
            ],
            'add' => [],
            'edit' => [
                'admin.basic-controls.update',
            ],
            'delete' => [],
        ],
    ],

    'color_settings' => [
        'label' => "Color Setting",
        'access' => [
            'view' => [
                'admin.color-settings',
            ],
            'add' => [],
            'edit' => [
                'admin.color-settings.update',
            ],
            'delete' => [],
        ],
    ],

    'email_controls' => [
        'label' => "Email Controls",
        'access' => [
            'view' => [
                'admin.email-controls',
            ],
            'add' => [],
            'edit' => [
                'admin.email-controls.update',
            ],
            'delete' => [],
        ],
    ],

    'email_template' => [
        'label' => "Email Template",
        'access' => [
            'view' => [
                'admin.email-template.show',
            ],
            'add' => [],
            'edit' => [
                'admin.email-template.edit',
            ],
            'delete' => [],
        ],
    ],

    'sms_config' => [
        'label' => "SMS Config",
        'access' => [
            'view' => [
                'admin.sms.config',
            ],
            'add' => [],
            'edit' => [
                'admin.sms.config',
            ],
            'delete' => [],
        ],
    ],

    'sms_template' => [
        'label' => "SMS Template",
        'access' => [
            'view' => [
                'admin.sms-template',
            ],
            'add' => [],
            'edit' => [
                'admin.sms-template.edit',
            ],
            'delete' => [],
        ],
    ],

    'notify_config' => [
        'label' => "Notification Config",
        'access' => [
            'view' => [
                'admin.notify-config',
            ],
            'add' => [],
            'edit' => [
                'admin.notify-config.update',
            ],
            'delete' => [],
        ],
    ],

    'notify_template' => [
        'label' => "Notification Template",
        'access' => [
            'view' => [
                'admin.notify-template.show',
                'admin.notify-template.edit',
            ],
            'add' => [],
            'edit' => [
                'admin.notify-template.update',
            ],
            'delete' => [],
        ],
    ],

    'language_settings' => [
        'label' => "Language Settings",
        'access' => [
            'view' => [
                'admin.language.index',
            ],
            'add' => [
                'admin.language.create',
            ],
            'edit' => [
                'admin.language.edit',
                'admin.language.keywordEdit',
            ],
            'delete' => [
                'admin.language.delete'
            ],
        ],
    ],
    'theme_settings' =>  [
        'label' => "Theme Settings",
        'access' => [
            'view' => [
                'admin.logo-seo',
                'admin.breadcrumb',
                'admin.template.show',
                'admin.content.index',
            ],
            'add' => [
                'admin.content.create'
            ],
            'edit' => [
                'admin.logoUpdate',
                'admin.seoUpdate',
                'admin.breadcrumbUpdate',
                'admin.content.show',
            ],
            'delete' => [
                'admin.content.delete'
            ],
        ],
    ],
	'blogcategory' => [
        'label' => "Blog Category",
        'access' => [
            'view' => [
                'admin.blog.category'
            ],
            'add' => ['admin.blog.category'],
            'edit' => [
            	'admin.blog.category',
                'admin.blog.category',
            ],
            'delete' => ['admin.blog.category.delete'],
        ],
    ],
    'blog' => [
        'label' => "Blog",
        'access' => [
            'view' => [
                'admin.blog',
                'admin.blog.search'
            ],
            'add' => ['admin.blog.create'],
            'edit' => [
            	'admin.blog.edit',
                'admin.blog.show',
            ],
            'delete' => ['admin.blog.delete'],
        ],
    ]

];

return $arr;



