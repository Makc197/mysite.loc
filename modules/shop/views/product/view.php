<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\modules\shop\models\Product */
?>
<div class="product-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'type',
            'title',
            'description',
            'price',
        ],
    ]) ?>

</div>
