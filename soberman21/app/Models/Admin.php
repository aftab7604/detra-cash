<?php

namespace App\Models;

use App\Http\Traits\Notify;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class Admin extends Authenticatable
{
    use Notifiable, Notify;
    protected $guarded = ['id'];
    protected $hidden = [
        'password', 'remember_token',
    ];
    protected $casts = [
      'admin_access' => 'object'
    ];

    protected $appends = ['photo'];
    public function role()
    {
        return $this->belongsTo(Role::class);
    }
    
    public function getPhotoAttribute()
    {
        return getFile(config('location.admin.path').$this->image);
    }


    public function siteNotificational()
    {
        return $this->morphOne(SiteNotification::class, 'siteNotificational', 'site_notificational_type', 'site_notificational_id');
    }


    public function chatNotificational()
    {
        return $this->morphOne(ChatNotification::class, 'chatNotificational', 'chat_notificational_type', 'chat_notificational_id');
    }

    public function sendPasswordResetNotification($token)
    {
        $this->mail($this, 'PASSWORD_RESET', $params = [
            'message' => '<a href="'.url('admin/password/reset',$token).'?email='.$this->email.'" target="_blank">Click To Reset Password</a>'
        ]);
    }

}
