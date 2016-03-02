<?php
use app\components\Hello;
?>
<?=$name?>
<div>Виджет говорит: <?=Hello::widget(['message'=>"Hello World"])?></div>
