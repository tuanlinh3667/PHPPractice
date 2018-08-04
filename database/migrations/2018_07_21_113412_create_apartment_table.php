<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBakeriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('apartment', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->string('adress');
            $table->integer('price');
            $table->unsignedInteger('categoryId');
            $table->foreign('categoryId')->references('id')->on('categories');
            $table->string('images');
            $table->string('content');
            $table->string('description');
            $table->timestamps();
            $table->integer('status')->default(1);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('bakeries');
    }
}
