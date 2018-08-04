<?php

use Illuminate\Database\Seeder;

class ArticlesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \Illuminate\Support\Facades\DB::table('articles')->truncate();
        \Illuminate\Support\Facades\DB::table('articles')->insert([
            [
                'name'=>'Chung cư cao cấp',
                'author'=>'Jake',
                'content'=>'Chung cư cao cấp có bể bơi',
                'images'=>'http://chungcuhanoi24h.com.vn/Upload/vincom-central-ba-trieu.jpg'
            ],
            [
                'name'=>'Chung cư thiên nhiên',
                'author'=>'Anny',
                'content'=>'Chung cư hoang dã kiểu rất đã',
                'images'=>'http://chungcuhanoi24h.com.vn/Upload/chung-cu-gamuda-the-wings.jpg'
            ],
            [
                'name'=>'Chung cư thu nhập thấp',
                'author'=>'Bob',
                'content'=>'Chung cư rất rẻ nhưng lại rất ngon',
                'images'=>'http://image.diaoconline.vn/sanpham/2012/06/04_Diaoconline_Cheery2Apartment_Phoicanh.jpg'
            ],
            [
                'name'=>'Chung cư cho siêu anh hùng',
                'author'=>'Iron',
                'content'=>'Chung cư của siêu anh hùng',
                'images'=>'https://kenh14cdn.com/A3YmnWqkHeph7OwGyu6TwbX57tgTw/Image/2012/05/05A/120512kpbitexco03_4cbe8.jpg'
            ]
        ]);
    }
}
