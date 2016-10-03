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
        ini();
    }

    public static void ini() {
        
        CMDB cnn = new CMDB();
        if (cnn.CMDB(1) == 1) {
            jfLogin log = new jfLogin();
            log.setVisible(true);
            log.setLocationRelativeTo(null);
        } else {

        }
    }

}
