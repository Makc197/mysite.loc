<?php

namespace app\modules\shop\controllers;

use yii\web\Controller;
use Yii;

class DefaultController extends BaseController
{
    public function actionIndex()
    {       
        return $this->render('index');
    }
}
