<?php
use yii\helpers\Html;
use yii\helpers\Url;
/* @var $test string */
?>

<?= Html::beginForm(Url::to(['/search/search/']), 'get', ['class' => 'navbar-form navbar-left']) ?>
        <div class="form-group">
          <?= Html::textInput('q', $text, ['class' => 'form-control', 'placeholder' => 'Поиск...']) ?>
          <span class="input-group-btn">
            <?= Html::submitButton('<i class="glyphicon glyphicon-search"></i>', ['class' => 'btn btn-primary']) ?>
          </span>
        </div><!-- /input-group -->
<?= Html::endForm() ?>
