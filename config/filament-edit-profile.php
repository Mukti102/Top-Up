<?php

return [
    'show_custom_fields' => true,
    'custom_fields' => [
        'nomor_admin' => [
            'type' => 'text', // required
            'label' => 'Nomor Admin', // required
            'placeholder' => 'Masukkan Nomor telephone atau wa yang bisa di hubungi', // optional
            'id' => 'custom-field-1', // optional
            'required' => true, // optional
            'rules' => [], // optional
            'hint_icon' => '', // optional
            'hint' => '', // optional
            'suffix_icon' => '', // optional
            'prefix_icon' => '', // optional
            'default' => '', // optional
            'column_span' => 'full', // optional
            'autocomplete' => false, // optional
        ],
    ]
];
