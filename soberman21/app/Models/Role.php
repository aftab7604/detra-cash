<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    use HasFactory;

    // Define the table name if it doesn't follow Laravel's naming convention
    protected $table = 'roles';

    // Define the fillable properties
    protected $fillable = [
        'role',
        'permissions',
        'status',
    ];

    protected $casts = [
        'permissions' => 'object'
    ];
}
