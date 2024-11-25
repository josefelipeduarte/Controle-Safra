<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Venda extends Model
{
    use HasFactory;
    protected $table = 'venda'; // Nome correto da tabela
    protected $fillable = ['tipo_produto', 'quantidade', 'valor_venda'];
}
