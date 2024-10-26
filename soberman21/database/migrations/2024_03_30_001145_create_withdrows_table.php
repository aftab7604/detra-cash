<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('withdrows', function (Blueprint $table) {
            $table->id();
            $table->integer('user_id');
            $table->integer('gateway_id');
            $table->float('amount');
            $table->float('charge');
            $table->string('trx_type');
            $table->string('remarks');
            $table->enum('status', ['pending', 'complete', 'cancel'])->default('pending');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('withdrows');
    }
};
