<?php
class IndexController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        $transactionModel = new Application_Model_Transaction();

        $beginningDate = $this->getRequest()->getParam('beginningdate');
        $endDate = $this->getRequest()->getParam('enddate');

        $transactions = $transactionModel->getTransactionsByDateRange($beginningDate,$endDate);

        foreach($transactions as &$transaction){
            $transaction['profit'] = number_format(($transaction['retail'] - $transaction['cost']),2,'.','');
            $transaction['discount'] = number_format(($transaction['profit'] / $transaction['retail'] * 100),
                                                            2,'.','');
        }
        if(!empty($beginningDate)){
            $this->view->beginningDate = $beginningDate . " 00:00:00";
        }
        else{
            $this->view->beginningDate = "The beginning of time";
        }
        if(!empty($endDate)){
            $this->view->endDate = $endDate . " 23:59:59";
        }
        else{
            $this->view->endDate = "the end of time.";
        }
        $this->view->transactions = $transactions;
    }


}
