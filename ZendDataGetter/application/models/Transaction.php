<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Snazzy
 * Date: 8/8/13
 * Time: 3:31 PM
 * To change this template use File | Settings | File Templates.
 */
class Application_Model_Transaction extends Zend_Db_Table_Abstract
{
    protected $_name = 'transaction';

    public function getTransactionsByDateRange($min,$max){
        $db = Zend_Db_Table::getDefaultAdapter();
        $select = $db->select()
                     ->from(array('t'=>'transaction'),array('t.date','c.first_name','c.last_name',
                                                            't.quantity','t.retail','t.cost'))
                     ->join(array('c'=>'customer'), 't.customer_id = c.customer_id',array());

        if(!empty($min)){
            if($this->checkDate($min)){
                $min = $min . " 00:00:00";
                $select->where("t.date > ? ", $min);
            }
            else{
                throw new Exception("Not a valid date");
            }
        }

        if(!empty($max)){
            if($this->checkDate($max)){
                $max = $max . " 23:59:59";
                $select->where("t.date < ? ",$max);
            }
            else{
                throw new Exception("Not a valid date");
            }
        }

        $stmt = $select->query();
        return $stmt->fetchAll();
    }

    private function checkDate($date){
        list($yy,$mm,$dd) = explode("-",$date);
        if(is_numeric($yy) && is_numeric($mm) && is_numeric($dd)){
            return checkdate($mm,$dd,$yy);
        }
        return false;
    }
}