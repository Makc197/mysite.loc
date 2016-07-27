<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\modules\shop\models\CD */
?>
<div class="cd-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'type',
            'title',
            'description',
            'price',
            'author',
            'playlenght',
        ],
    ]) ?>

</div>
