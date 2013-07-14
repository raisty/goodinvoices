<?php

/*
Class: Index

Purpose: The index class is the replacement for primary keys as the ID field in various tables - ie. si_invoices 

Details:
$node = this is the module in question - ie 'invoice', 'products' etc..
$sub_node = the sub set of the node - ie. this is the 'invoice preference' if node = 'invoice'
$sub_node_2 = 2nd sub set of the node - ir. this is the 'biller' if node = 'invoice'

*/

class index
{

    public static function next($node,$sub_node="",$biller_id="")
    {

        global $db;
        global $auth_session;
        
        $preference=0;
        $preference=getDefaultNumbering();
        $sub_node_2=0;
        $sub_node_2=getDefaultSuppType();

       # $subnode = "";

        if ($sub_node !="")
        {
            $subnode = "and sub_node = ".$sub_node; 
        }
    
        if($preference==1)
        {
            $pref = " and year = ".date('y');
            $numb = date('y').'0001';
        }
        else
        {
            $pref = " and year IS NULL";
            $numb = 1;
        }
        
        if($sub_node_2==1 && $biller_id!="")
        {
            $sub_node2 = " and sub_node_2 = ".$biller_id;
            $numb = addslashes($biller_id).$numb;
        }
        else
        {
            $sub_node2 = " and sub_node_2 IS NULL";
            $numb = $numb;
        }
        
        $sql = "select 
                      id 
                  from 
                      ".TB_PREFIX."index 
                  where
                      domain_id = :domain_id
                  and
                      node = :node
                 ".$subnode.$pref.$sub_node2;
        
        
        $sth = $db->query($sql,':node',$node,':domain_id',$auth_session->domain_id) or die(htmlsafe(end($dbh->errorInfo())));
 
        $index = $sth->fetch();

        if($index['id'] == "")
        {
            $id = $numb;
        
        } else {
            
            $id = $index['id'] + 1;
        }
        
        return $id;

    }

    public static function increment($node,$sub_node="",$biller_id="")
    {
    
        $next = index::next($node,$sub_node,$biller_id);

        global $db;
        global $auth_session;
        
        $preference=0;
        $preference=getDefaultNumbering();
        $sub_node_2=0;
        $sub_node_2=getDefaultSuppType();
        
        /*
        if ($sub_node !="") 
        {
            $subnode = "and sub_node = ".$sub_node; 
        }
        */

        if($preference==1)
        {
            $pref = date('y');
            $numb = date('y').'0001';
        }
        else
        {
            $pref = "NULL";
            $numb = 1;
        }
        
        if($sub_node_2==1 && $biller_id!="")
        {
            $sub_node2 = addslashes($biller_id);
            $numb = addslashes($biller_id).$numb;
        }
        else
        {
            $sub_node2 = "NULL";
            $numb = $numb;
        }

        if ($next == $numb)
        {

            $sql = "insert into ".TB_PREFIX."index (id, node, sub_node, sub_node_2, year, domain_id) VALUES (:id, :node, :sub_node, :sub_node_2, :year, :domain_id);";

        } else {

            $sql ="update
                        ".TB_PREFIX."index 
                    set 
                        id = :id 
                    where
                        node = :node
                    and
                        domain_id = :domain_id
                    and
                        sub_node = :sub_node
                    and
                        sub_node_2 = :sub_node_2
                    and
                        year = :year";
        }

        $sth = $db->query($sql,':id',$next,':node',$node,':sub_node',$sub_node,':sub_node_2',$sub_node2,':year',$pref,':domain_id',$auth_session->domain_id) or die(htmlsafe(end($dbh->errorInfo())));

        return $next;

    }


    public static function rewind($node,$sub_node,$biller_id)
    {

        global $db;
        global $auth_session;
        
        $preference=0;
        $preference=getDefaultNumbering();
        $sub_node_2=0;
        $sub_node_2=getDefaultSuppType();
        
        if ($sub_node !="")
        {
            $subnode = "and sub_node = ".$sub_node; 
        }
        
        if($preference==1)
        {
            $year=date("y");
            $pref = " and year = ".$year;
        }
        else
        {
            $pref = " and year = NULL";
        }
        
        if($sub_node_2==1 && $biller_id!="")
        {
            $sub_node2 = " and sub_node_2 = ".addslashes($biller_id);
        }
        else
        {
            $sub_node2 = " and sub_node_2 IS NULL";
        }

        $sql ="update
                    ".TB_PREFIX."index 
                set 
                    id = (id - 1) 
                where
                    node = :node
                and
                    domain_id = :domain_id
                ".$subnode.$pref.$sub_node2;

        $sth = $db->query($sql,':node',$node,':domain_id',$auth_session->domain_id) or die(htmlsafe(end($dbh->errorInfo())));


        return $sth;

    }
}




