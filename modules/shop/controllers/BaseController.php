<?php

namespace app\modules\shop\controllers;

use yii\web\Controller;
use Yii;

class BaseController extends Controller
{
    public function behaviors()
    {
        return [
            'ghost-access'=> [
                'class' => 'webvimark\modules\UserManagement\components\GhostAccessControl',
            ],
        ];
    }
}
