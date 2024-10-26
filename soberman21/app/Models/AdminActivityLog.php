<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AdminActivityLog extends Model
{
    use HasFactory;

    protected $fillable = [
        'admin_id',
        'activity',
        'description',
    ];

    public function admin()
    {
        return $this->belongsTo(Admin::class);
    }
}

