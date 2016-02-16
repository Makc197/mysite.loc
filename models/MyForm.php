<?php
namespace app\models;
use yii;
use yii\base\Model;

class MyForm extends Model
{
    public $name;
    public $email;
    public $file;

    public function rules() 
        {
            return[         
               [['name','email'], 'required', 'message' => 'Не заполнено поле'],
               ['email', 'email', 'message' => 'Неправильно заполнено поле e-mail'],
               [['file'],'file', 'extensions' => 'jpg, png' ]
            ];    
        }
}

?>
