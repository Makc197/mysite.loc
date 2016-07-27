<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\modules\shop\models\Book */
?>
<div class="book-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'type',
            'title',
            'description',
            'price',
            'author',
            'numpages',
        ],
    ]) ?>

</div>
