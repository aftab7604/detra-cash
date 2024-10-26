<?php

namespace Database\Seeders;

use App\Models\Admin;
use App\Models\Role;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $adminUser = Admin::first();
//        Role::create(['role' => 'admin', 'status' => 1]);
        $adminUser->assignRole(['admin']);
//        auth()->user()->assignRole('admin');

        // \App\Models\User::factory(10)->create();
    }
}
