<?php

namespace app\modules\shop\models;

use Yii;
use himiklab\yii2\search\behaviors\SearchBehavior;

/**
 * This is the model class for table "books".
 *
 * @property integer $id
 * @property string $type
 * @property string $title
 * @property string $description
 * @property double $price
 * @property string $author
 * @property string $numpages
 */
class Book extends \yii\db\ActiveRecord
{
    public function behaviors()
    {
        return [
        'search' => [
                'class' => SearchBehavior::className(),
                'searchScope' => function ($model) {
                    /** @var \yii\db\ActiveQuery $model */
                    $model->select(['id','type','title', 'description', 'price', 'author','numpages']);
                    //$model->andWhere(['indexed' => true]);
                },
                'searchFields' => function ($model) {
                    /** @var self $model */
                 
                    return [
                        ['name' => 'title', 'value' => $model->title],
                        ['name' => 'body', 'value' => strip_tags($model->description)],
                        ['name' => 'url', 
                            'value' => \yii\helpers\Url::to(['/shop/book/view','id' => $model->id]), 
                            'type' => SearchBehavior::FIELD_KEYWORD],
                        // ['name' => 'model', 'value' => 'page', 'type' => SearchBehavior::FIELD_UNSTORED],
                    ];
                }
            ],
        ];
    }
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'books';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title', 'description', 'price', 'author', 'numpages'], 'required'],
            [['price', 'numpages'], 'number'],
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
            'numpages' => 'Numpages',
        ];
    }
}
