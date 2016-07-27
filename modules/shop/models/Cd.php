<?php

namespace app\modules\shop\models;

use Yii;

/**
 * This is the model class for table "cds".
 *
 * @property integer $id
 * @property string $type
 * @property string $title
 * @property string $description
 * @property double $price
 * @property string $author
 * @property double $playlenght
 */
class CD extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'cds';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title', 'description', 'price', 'author', 'playlenght'], 'required'],
            [['price', 'playlenght'], 'number'],
            [['type'], 'string', 'max' => 30],
            [['title'], 'string', 'max' => 500],
            [['description'], 'string', 'max' => 1000],
            [['author'], 'string', 'max' => 200]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'type' => 'Type',
            'title' => 'Title',
            'description' => 'Description',
            'price' => 'Price',
            'author' => 'Author',
            'playlenght' => 'Playlenght',
        ];
    }
}
