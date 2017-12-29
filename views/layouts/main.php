<?php

/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use app\assets\AppAsset;
use webvimark\modules\UserManagement\components\GhostMenu;
use webvimark\modules\UserManagement\components\GhostNav;
use webvimark\modules\UserManagement\UserManagementModule;
use app\components\widgets\SearchWidget;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body>
<?php $this->beginBody() ?>

<div class="wrap">
    <?php

    NavBar::begin([
        'brandLabel' => 'Каталог товаров',
        'brandUrl' => Yii::$app->homeUrl,
        'options' => [
            'class' => ' navbar-default navbar-fixed-top',
        ],
    ]);

    echo Nav::widget([
        'options' => ['class' => 'navbar-nav navbar-left'],
        'items' => [
            [
                'label' => 'Home',
                'url' => ['/site'],
                //'linkOptions' => [Yii::$app->homeUrl],
            ],

            [
                'label' => 'Список товаров',
                'visible' => !Yii::$app->user->isGuest,
                'items' => [
                    ['label' => 'Книги', 'url' => ['/shop/book/']],
                    ['label' => 'Компакт диски', 'url' => ['/shop/cd']],
                    ['label' => 'Прочие товары', 'url' => ['/shop/product']],
                    '<li class="divider"></li>',
                    '<li class="dropdown-header">Категория 2</li>',
                    ['label' => 'Еще одна ссылка', 'url' => ['#']],
                ],
            ],

        ],
    ]);
    
    echo Nav::widget([
        'options' => ['class' => 'navbar-nav navbar-right'],
        'items' => [
            [
                'label' => 'Login',
                'url' => ['/user-management/auth/login'],
                'visible' => Yii::$app->user->isGuest
            ],

            [
                'label' => 'Logout',
                'url' => ['/user-management/auth/logout'],
                'visible' => !Yii::$app->user->isGuest
            ],
        ],
    ]);

    $items = UserManagementModule::menuItems();
    $items2 = [
//        ['label' => 'Login', 'url' => ['/user-management/auth/login']],
//        ['label' => 'Logout', 'url' => ['/user-management/auth/logout']],
        ['label' => 'Registration', 'url' => ['/user-management/auth/registration']],
        ['label' => 'Change own password', 'url' => ['/user-management/auth/change-own-password']],
        ['label' => 'Password recovery', 'url' => ['/user-management/auth/password-recovery']],
        ['label' => 'E-mail confirmation', 'url' => ['/user-management/auth/confirm-email']],
    ];
    //foreach($items2 as $item) array_push($items, $item);
    $items = array_merge($items,$items2);
    
    echo GhostNav::widget([
        'options' => ['class' => 'navbar-nav navbar-right'],
        'encodeLabels' => false,
        'activateParents' => true,

        'items' => [
            [
                'label' => 'Frontend routes',
                'items' => $items,
            ],
        ],

    ]); ?>
    
    
    <?= SearchWidget::widget(['text'=>'']); ?>    
    
   <?php NavBar::end(); ?>
   

    <div class="container">        
        <?= Breadcrumbs::widget([
            'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
        ]) ?>
        <?= $content ?>
    </div>
</div>

<footer class="footer">
    <div class="container">
        <p class="pull-left">&copy; My Company <?= date('Y') ?></p>

        <p class="pull-right"><?= Yii::powered() ?></p>
    </div>
</footer>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
