<?php
namespace app\controllers;

use yii\web\Controller;
use yii\data\ArrayDataProvider;
use Yii;

class SearchController extends Controller {
    
    public function actionIndex($q = '')
    {
        /** @var \himiklab\yii2\search\Search $search */
        $search = Yii::$app->search;
        $searchData = $search->find($q); // Search by full index.
        //$searchData = $search->find($q, ['model' => 'page']); // Search by index provided only by model `page`.

        $dataProvider = new ArrayDataProvider([
            'allModels' => $searchData['results'],
            'pagination' => ['pageSize' => 50 ],
        ]);
        return $this->render(
            'found',
            [
                'hits' => $dataProvider->getModels(),
                'pagination' => $dataProvider->getPagination(),
                'query' => $searchData['query']
            ]
        );
    }

    // Of course, this function should be in the console part of the application!
    /*public function actionIndexing()
    {
        // @var \himiklab\yii2\search\Search $search
        $search = Yii::$app->search;
        $search->index();
    }*/
}
