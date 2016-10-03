/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmedicinae;

import cnncmdb.CMDB; 


public class CMedicinae {
        
    public static void main(String[] args) {
        // TODO code application logic here
        CMDB cnn = new CMDB();
        jfLogin log = new jfLogin();
        
        if (cnn.CMDB()== 1){
            log.setVisible(true);
            log.setLocationRelativeTo(null);            
        }
    }
    
}
