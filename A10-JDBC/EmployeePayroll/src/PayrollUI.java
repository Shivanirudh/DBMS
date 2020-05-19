
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.*;
import javax.swing.JOptionPane;
import static javax.swing.JOptionPane.ERROR_MESSAGE;
import static javax.swing.JOptionPane.INFORMATION_MESSAGE;

public class PayrollUI extends javax.swing.JFrame {
    
    Connection conn;
    
    public PayrollUI() {
        initComponents();
        try{
            String url = "jdbc:oracle:thin:@localhost:1521:ORCL";
            conn = DriverManager.getConnection(url, "hr", "hr");
        }
        catch(Exception e){
            System.err.println("Connection Exception!");
            System.err.println(e.getMessage());
        }
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        DisplayTab = new javax.swing.JTabbedPane();
        jPanel1 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        insButton = new javax.swing.JButton();
        insEmpID = new javax.swing.JTextField();
        insEmpName = new javax.swing.JTextField();
        insEmpDOB = new javax.swing.JTextField();
        insEmpSex = new javax.swing.JTextField();
        insEmpDesignation = new javax.swing.JTextField();
        insEmpBasic = new javax.swing.JTextField();
        jPanel3 = new javax.swing.JPanel();
        jPanel6 = new javax.swing.JPanel();
        jLabel8 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        jLabel10 = new javax.swing.JLabel();
        jLabel11 = new javax.swing.JLabel();
        jLabel12 = new javax.swing.JLabel();
        jLabel13 = new javax.swing.JLabel();
        jLabel14 = new javax.swing.JLabel();
        updButton = new javax.swing.JButton();
        updEmpID = new javax.swing.JTextField();
        updEmpName = new javax.swing.JTextField();
        updEmpDOB = new javax.swing.JTextField();
        updEmpSex = new javax.swing.JTextField();
        updEmpDesignation = new javax.swing.JTextField();
        updEmpBasic = new javax.swing.JTextField();
        jPanel4 = new javax.swing.JPanel();
        jLabel15 = new javax.swing.JLabel();
        jLabel16 = new javax.swing.JLabel();
        delEmpID = new javax.swing.JTextField();
        delButton = new javax.swing.JButton();
        jPanel5 = new javax.swing.JPanel();
        jPanel7 = new javax.swing.JPanel();
        jLabel17 = new javax.swing.JLabel();
        jLabel18 = new javax.swing.JLabel();
        searchEmpID = new javax.swing.JTextField();
        searchButton = new javax.swing.JButton();
        jLabel22 = new javax.swing.JLabel();
        SearchValEmpID = new javax.swing.JTextField();
        jLabel23 = new javax.swing.JLabel();
        SearchValEmpName = new javax.swing.JTextField();
        jLabel24 = new javax.swing.JLabel();
        SearchValEmpSex = new javax.swing.JTextField();
        jLabel25 = new javax.swing.JLabel();
        SearchValEmpDesignation = new javax.swing.JTextField();
        jLabel26 = new javax.swing.JLabel();
        SearchValEmpDOB = new javax.swing.JTextField();
        jLabel27 = new javax.swing.JLabel();
        SearchValEmpBasic = new javax.swing.JTextField();
        jLabel28 = new javax.swing.JLabel();
        SearchValEmpNetPay = new javax.swing.JTextField();
        jLabel19 = new javax.swing.JLabel();
        SearchValEmpDA = new javax.swing.JTextField();
        jLabel29 = new javax.swing.JLabel();
        SearchValEmpHRA = new javax.swing.JTextField();
        jLabel30 = new javax.swing.JLabel();
        SearchValEmpGross = new javax.swing.JTextField();
        jLabel31 = new javax.swing.JLabel();
        SearchValEmpPF = new javax.swing.JTextField();
        jLabel32 = new javax.swing.JLabel();
        SearchValEmpMC = new javax.swing.JTextField();
        jLabel33 = new javax.swing.JLabel();
        SearchValEmpTotDeduc = new javax.swing.JTextField();
        jLabel20 = new javax.swing.JLabel();
        jLabel21 = new javax.swing.JLabel();
        AppLabel = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("EMPLOYEE PAYROLL APPLICATION");
        setAlwaysOnTop(true);
        setBackground(new java.awt.Color(255, 255, 255));
        setForeground(java.awt.Color.white);
        setName("basePage"); // NOI18N

        DisplayTab.setTabPlacement(javax.swing.JTabbedPane.LEFT);
        DisplayTab.setToolTipText("");
        DisplayTab.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                DisplayTabMouseClicked(evt);
            }
        });

        jLabel1.setFont(new java.awt.Font("Tahoma", 1, 24)); // NOI18N
        jLabel1.setText("INSERT EMPLOYEE");
        jLabel1.setToolTipText("");

        jLabel2.setText("Employee ID           :");

        jLabel3.setText("Employee Name      :");

        jLabel4.setText("Date of Birth           :");

        jLabel5.setText("Sex                         :");

        jLabel6.setText("Designation            :");

        jLabel7.setText("Basic Pay               :");

        insButton.setText("Insert");
        insButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                insButtonActionPerformed(evt);
            }
        });

        insEmpDOB.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                insEmpDOBActionPerformed(evt);
            }
        });

        insEmpDesignation.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                insEmpDesignationActionPerformed(evt);
            }
        });

        insEmpBasic.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                insEmpBasicActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(149, 350, Short.MAX_VALUE)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jLabel2, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jLabel3, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 166, Short.MAX_VALUE)
                    .addComponent(jLabel4, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jLabel5, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jLabel6, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jLabel7, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addGap(40, 40, 40)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(insEmpID, javax.swing.GroupLayout.PREFERRED_SIZE, 210, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(insEmpName, javax.swing.GroupLayout.PREFERRED_SIZE, 210, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(insEmpDOB, javax.swing.GroupLayout.PREFERRED_SIZE, 210, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(insEmpSex, javax.swing.GroupLayout.PREFERRED_SIZE, 210, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(insEmpDesignation, javax.swing.GroupLayout.PREFERRED_SIZE, 210, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(insEmpBasic, javax.swing.GroupLayout.PREFERRED_SIZE, 210, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(375, 375, 375))
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(427, 427, 427)
                        .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 268, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(497, 497, 497)
                        .addComponent(insButton)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(30, 30, 30)
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 33, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(9, 9, 9)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 26, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(insEmpID, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(insEmpName, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel4, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(insEmpDOB, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel5, javax.swing.GroupLayout.PREFERRED_SIZE, 23, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(insEmpSex, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel6, javax.swing.GroupLayout.PREFERRED_SIZE, 26, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(insEmpDesignation, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel7, javax.swing.GroupLayout.DEFAULT_SIZE, 30, Short.MAX_VALUE)
                    .addComponent(insEmpBasic, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(31, 31, 31)
                .addComponent(insButton)
                .addGap(279, 279, 279))
        );

        DisplayTab.addTab("INSERT EMPLOYEE", null, jPanel1, "");
        jPanel1.getAccessibleContext().setAccessibleName("INSERT EMPLOYEE");
        jPanel1.getAccessibleContext().setAccessibleDescription("Insert Employee");

        jLabel8.setFont(new java.awt.Font("Tahoma", 1, 24)); // NOI18N
        jLabel8.setText("UPDATE EMPLOYEE");
        jLabel8.setToolTipText("");

        jLabel9.setText("Employee ID to update:");

        jLabel10.setText("Employee Name           :");

        jLabel11.setText("Date of Birth                :");

        jLabel12.setText("Sex                              :");

        jLabel13.setText("Designation                 :");

        jLabel14.setText("Basic Pay                    :");

        updButton.setText("Update");
        updButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                updButtonActionPerformed(evt);
            }
        });

        updEmpSex.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                updEmpSexActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel6Layout = new javax.swing.GroupLayout(jPanel6);
        jPanel6.setLayout(jPanel6Layout);
        jPanel6Layout.setHorizontalGroup(
            jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel6Layout.createSequentialGroup()
                .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addGroup(jPanel6Layout.createSequentialGroup()
                            .addGap(33, 33, 33)
                            .addComponent(jLabel8, javax.swing.GroupLayout.PREFERRED_SIZE, 268, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel6Layout.createSequentialGroup()
                            .addContainerGap()
                            .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                    .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                        .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                            .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                                .addGroup(jPanel6Layout.createSequentialGroup()
                                                    .addComponent(jLabel9, javax.swing.GroupLayout.PREFERRED_SIZE, 173, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                    .addGap(14, 14, 14))
                                                .addGroup(javax.swing.GroupLayout.Alignment.LEADING, jPanel6Layout.createSequentialGroup()
                                                    .addComponent(jLabel10, javax.swing.GroupLayout.PREFERRED_SIZE, 173, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)))
                                            .addGroup(javax.swing.GroupLayout.Alignment.LEADING, jPanel6Layout.createSequentialGroup()
                                                .addComponent(jLabel11, javax.swing.GroupLayout.PREFERRED_SIZE, 173, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)))
                                        .addGroup(javax.swing.GroupLayout.Alignment.LEADING, jPanel6Layout.createSequentialGroup()
                                            .addComponent(jLabel12, javax.swing.GroupLayout.PREFERRED_SIZE, 173, javax.swing.GroupLayout.PREFERRED_SIZE)
                                            .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)))
                                    .addGroup(javax.swing.GroupLayout.Alignment.LEADING, jPanel6Layout.createSequentialGroup()
                                        .addComponent(jLabel13, javax.swing.GroupLayout.PREFERRED_SIZE, 173, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)))
                                .addGroup(javax.swing.GroupLayout.Alignment.LEADING, jPanel6Layout.createSequentialGroup()
                                    .addComponent(jLabel14, javax.swing.GroupLayout.PREFERRED_SIZE, 173, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)))
                            .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                .addComponent(updEmpID)
                                .addComponent(updEmpName)
                                .addComponent(updEmpDOB)
                                .addComponent(updEmpSex)
                                .addComponent(updEmpDesignation)
                                .addComponent(updEmpBasic, javax.swing.GroupLayout.DEFAULT_SIZE, 210, Short.MAX_VALUE))))
                    .addGroup(jPanel6Layout.createSequentialGroup()
                        .addGap(146, 146, 146)
                        .addComponent(updButton)))
                .addContainerGap(244, Short.MAX_VALUE))
        );
        jPanel6Layout.setVerticalGroup(
            jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel6Layout.createSequentialGroup()
                .addGap(21, 21, 21)
                .addComponent(jLabel8, javax.swing.GroupLayout.PREFERRED_SIZE, 33, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(updEmpID, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel9, javax.swing.GroupLayout.PREFERRED_SIZE, 26, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(updEmpName, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel10, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(updEmpDOB, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel11, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel12, javax.swing.GroupLayout.PREFERRED_SIZE, 23, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(updEmpSex, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(updEmpDesignation, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel13, javax.swing.GroupLayout.PREFERRED_SIZE, 26, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel14, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(updEmpBasic, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(32, 32, 32)
                .addComponent(updButton)
                .addContainerGap())
        );

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel3Layout.createSequentialGroup()
                .addContainerGap(362, Short.MAX_VALUE)
                .addComponent(jPanel6, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(128, 128, 128))
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addGap(33, 33, 33)
                .addComponent(jPanel6, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(249, Short.MAX_VALUE))
        );

        DisplayTab.addTab("UPDATE EMPLOYEE", jPanel3);

        jLabel15.setFont(new java.awt.Font("Tahoma", 1, 24)); // NOI18N
        jLabel15.setText("DELETE EMPLOYEE");
        jLabel15.setToolTipText("");

        jLabel16.setText("ID of Employee to be deleted :");

        delButton.setText("Delete");
        delButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                delButtonActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel4Layout = new javax.swing.GroupLayout(jPanel4);
        jPanel4.setLayout(jPanel4Layout);
        jPanel4Layout.setHorizontalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel4Layout.createSequentialGroup()
                .addGap(486, 486, 486)
                .addComponent(jLabel15, javax.swing.GroupLayout.PREFERRED_SIZE, 268, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel4Layout.createSequentialGroup()
                .addContainerGap(333, Short.MAX_VALUE)
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel4Layout.createSequentialGroup()
                        .addComponent(jLabel16, javax.swing.GroupLayout.PREFERRED_SIZE, 224, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(67, 67, 67)
                        .addComponent(delEmpID, javax.swing.GroupLayout.PREFERRED_SIZE, 185, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(332, 332, 332))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel4Layout.createSequentialGroup()
                        .addComponent(delButton, javax.swing.GroupLayout.PREFERRED_SIZE, 81, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(523, 523, 523))))
        );
        jPanel4Layout.setVerticalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addGap(67, 67, 67)
                .addComponent(jLabel15, javax.swing.GroupLayout.PREFERRED_SIZE, 33, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(40, 40, 40)
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(delEmpID, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel16, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(30, 30, 30)
                .addComponent(delButton)
                .addContainerGap(375, Short.MAX_VALUE))
        );

        DisplayTab.addTab("DELETE EMPLOYEE", jPanel4);

        jLabel17.setFont(new java.awt.Font("Tahoma", 1, 24)); // NOI18N
        jLabel17.setText("SEARCH EMPLOYEE");
        jLabel17.setToolTipText("");

        jLabel18.setText("Employee ID                        :");

        searchEmpID.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                searchEmpIDActionPerformed(evt);
            }
        });

        searchButton.setText("Search");
        searchButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                searchButtonActionPerformed(evt);
            }
        });

        jLabel22.setText("Employee ID");

        jLabel23.setText("Employee Name");

        SearchValEmpName.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                SearchValEmpNameActionPerformed(evt);
            }
        });

        jLabel24.setText("Sex");

        SearchValEmpSex.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                SearchValEmpSexActionPerformed(evt);
            }
        });

        jLabel25.setText("Designation");

        SearchValEmpDesignation.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                SearchValEmpDesignationActionPerformed(evt);
            }
        });

        jLabel26.setText("DoB");

        jLabel27.setText("Basic Pay");

        SearchValEmpBasic.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                SearchValEmpBasicActionPerformed(evt);
            }
        });

        jLabel28.setText("Net Pay");

        SearchValEmpNetPay.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                SearchValEmpNetPayActionPerformed(evt);
            }
        });

        jLabel19.setText("DA");

        jLabel29.setText("HRA");

        SearchValEmpHRA.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                SearchValEmpHRAActionPerformed(evt);
            }
        });

        jLabel30.setText("Gross Pay");

        jLabel31.setText("Provident Fund(PF)");

        jLabel32.setText("Mediclaim(MC)");

        jLabel33.setText("Total Deductions");

        javax.swing.GroupLayout jPanel7Layout = new javax.swing.GroupLayout(jPanel7);
        jPanel7.setLayout(jPanel7Layout);
        jPanel7Layout.setHorizontalGroup(
            jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel7Layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel7Layout.createSequentialGroup()
                        .addComponent(jLabel18, javax.swing.GroupLayout.PREFERRED_SIZE, 142, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(searchEmpID, javax.swing.GroupLayout.PREFERRED_SIZE, 185, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(148, 148, 148))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel7Layout.createSequentialGroup()
                        .addComponent(searchButton, javax.swing.GroupLayout.PREFERRED_SIZE, 81, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(317, 317, 317))))
            .addGroup(jPanel7Layout.createSequentialGroup()
                .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel7Layout.createSequentialGroup()
                        .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel7Layout.createSequentialGroup()
                                .addContainerGap()
                                .addComponent(jLabel28, javax.swing.GroupLayout.PREFERRED_SIZE, 108, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(jPanel7Layout.createSequentialGroup()
                                .addGap(341, 341, 341)
                                .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(SearchValEmpHRA)
                                    .addComponent(jLabel29, javax.swing.GroupLayout.PREFERRED_SIZE, 95, javax.swing.GroupLayout.PREFERRED_SIZE))))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(SearchValEmpGross)
                            .addComponent(jLabel30, javax.swing.GroupLayout.PREFERRED_SIZE, 95, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(SearchValEmpNetPay, javax.swing.GroupLayout.PREFERRED_SIZE, 95, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addGroup(jPanel7Layout.createSequentialGroup()
                        .addGap(240, 240, 240)
                        .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel7Layout.createSequentialGroup()
                                .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                    .addComponent(SearchValEmpPF)
                                    .addComponent(jLabel31, javax.swing.GroupLayout.PREFERRED_SIZE, 95, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                    .addComponent(SearchValEmpMC)
                                    .addComponent(jLabel32, javax.swing.GroupLayout.PREFERRED_SIZE, 95, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                    .addComponent(SearchValEmpTotDeduc)
                                    .addComponent(jLabel33, javax.swing.GroupLayout.PREFERRED_SIZE, 95, javax.swing.GroupLayout.PREFERRED_SIZE)))
                            .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                .addComponent(SearchValEmpDA)
                                .addComponent(jLabel19, javax.swing.GroupLayout.DEFAULT_SIZE, 95, Short.MAX_VALUE)))))
                .addGap(248, 262, Short.MAX_VALUE))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel7Layout.createSequentialGroup()
                .addGap(0, 0, Short.MAX_VALUE)
                .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel7Layout.createSequentialGroup()
                        .addComponent(jLabel17, javax.swing.GroupLayout.PREFERRED_SIZE, 268, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(194, 194, 194))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel7Layout.createSequentialGroup()
                        .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(jLabel22, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(SearchValEmpID, javax.swing.GroupLayout.PREFERRED_SIZE, 104, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(SearchValEmpName)
                            .addComponent(jLabel23, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(jLabel24, javax.swing.GroupLayout.DEFAULT_SIZE, 95, Short.MAX_VALUE)
                            .addComponent(SearchValEmpSex))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(jLabel25, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(SearchValEmpDesignation, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(jLabel26, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(SearchValEmpDOB, javax.swing.GroupLayout.PREFERRED_SIZE, 98, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(18, 18, 18)
                        .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel27, javax.swing.GroupLayout.PREFERRED_SIZE, 108, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(SearchValEmpBasic, javax.swing.GroupLayout.PREFERRED_SIZE, 108, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(57, 57, 57))))
        );
        jPanel7Layout.setVerticalGroup(
            jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel7Layout.createSequentialGroup()
                .addGap(24, 24, 24)
                .addComponent(jLabel17, javax.swing.GroupLayout.PREFERRED_SIZE, 33, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jLabel18, javax.swing.GroupLayout.DEFAULT_SIZE, 28, Short.MAX_VALUE)
                    .addComponent(searchEmpID))
                .addGap(14, 14, 14)
                .addComponent(searchButton)
                .addGap(46, 46, 46)
                .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(jLabel23, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(jLabel22, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(jLabel25, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(jLabel24, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(jLabel26, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(jLabel27, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel7Layout.createSequentialGroup()
                        .addGap(34, 34, 34)
                        .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(SearchValEmpID, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(SearchValEmpName, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(SearchValEmpSex, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(SearchValEmpDesignation, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(SearchValEmpDOB, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(SearchValEmpBasic, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE))))
                .addGap(42, 42, 42)
                .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel7Layout.createSequentialGroup()
                        .addComponent(jLabel19, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(SearchValEmpDA, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel7Layout.createSequentialGroup()
                        .addComponent(jLabel29, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(SearchValEmpHRA, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel7Layout.createSequentialGroup()
                        .addComponent(jLabel30, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(SearchValEmpGross, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(18, 18, 18)
                .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel7Layout.createSequentialGroup()
                        .addComponent(jLabel31, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(SearchValEmpPF, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel7Layout.createSequentialGroup()
                        .addComponent(jLabel32, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(SearchValEmpMC, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel7Layout.createSequentialGroup()
                        .addComponent(jLabel33, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(SearchValEmpTotDeduc, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(20, 20, 20)
                .addGroup(jPanel7Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(SearchValEmpNetPay, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel28, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(110, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout jPanel5Layout = new javax.swing.GroupLayout(jPanel5);
        jPanel5.setLayout(jPanel5Layout);
        jPanel5Layout.setHorizontalGroup(
            jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel5Layout.createSequentialGroup()
                .addContainerGap(193, Short.MAX_VALUE)
                .addComponent(jPanel7, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(145, 145, 145))
        );
        jPanel5Layout.setVerticalGroup(
            jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel5Layout.createSequentialGroup()
                .addGap(0, 0, Short.MAX_VALUE)
                .addComponent(jPanel7, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
        );

        DisplayTab.addTab("SEARCH EMPLOYEE", jPanel5);

        jLabel20.setText("jLabel20");

        jLabel21.setText("jLabel21");

        AppLabel.setFont(new java.awt.Font("Tahoma", 1, 36)); // NOI18N
        AppLabel.setText("EMPLOYEE PAYROLL APPLICATION");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(DisplayTab)
                .addContainerGap())
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(AppLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 676, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(173, 173, 173))
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(layout.createSequentialGroup()
                    .addGap(0, 0, Short.MAX_VALUE)
                    .addComponent(jLabel20)
                    .addGap(0, 0, Short.MAX_VALUE)))
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(layout.createSequentialGroup()
                    .addGap(0, 0, Short.MAX_VALUE)
                    .addComponent(jLabel21)
                    .addGap(0, 0, Short.MAX_VALUE)))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(AppLabel, javax.swing.GroupLayout.PREFERRED_SIZE, 53, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(DisplayTab)
                .addContainerGap())
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(layout.createSequentialGroup()
                    .addGap(0, 0, Short.MAX_VALUE)
                    .addComponent(jLabel20)
                    .addGap(0, 0, Short.MAX_VALUE)))
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(layout.createSequentialGroup()
                    .addGap(0, 0, Short.MAX_VALUE)
                    .addComponent(jLabel21)
                    .addGap(0, 0, Short.MAX_VALUE)))
        );

        DisplayTab.getAccessibleContext().setAccessibleName("");

        getAccessibleContext().setAccessibleName("");
        getAccessibleContext().setAccessibleDescription("");

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void DisplayTabMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_DisplayTabMouseClicked
        // TODO add your handling code here:
    }//GEN-LAST:event_DisplayTabMouseClicked

    private void searchButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_searchButtonActionPerformed
        // TODO add your handling code here:
        try{
            
            if(searchEmpID.getText().isEmpty()){
                JOptionPane.showMessageDialog(this, "Missing EmpID value", "Value Error", ERROR_MESSAGE);
                throw new Exception();
            }

            int eid = Integer.parseInt(searchEmpID.getText());

            PreparedStatement ps = conn.prepareStatement("SELECT * FROM Employee_payroll WHERE eid = ?");
            ps.setInt(1, eid);
            ResultSet rs = ps.executeQuery();

            int count = 0;
            String empid = null, ename = null, dob = null, sex = null, designation = null, basic = null;
            String da = null, hra = null, gross = null;
            String pf = null, mc = null, tot_deduc = null;
            String net_pay = null;
            
            while(rs.next()){
                count+=1;
                            
                empid = rs.getString("eid");ename = rs.getString("ename");dob = rs.getString("dob");
                sex = rs.getString("sex");designation = rs.getString("designation");basic = rs.getString("basic");
                da = rs.getString("da");hra = rs.getString("hra");gross = rs.getString("gross");
                pf = rs.getString("pf");mc = rs.getString("mc");tot_deduc = rs.getString("tot_deduc");
                net_pay = rs.getString("net_pay");
            }       
 
            if(count == 0)
                JOptionPane.showMessageDialog(this, "Employee not found", "Search Results", INFORMATION_MESSAGE);
            else{
                SearchValEmpID.setText(empid);SearchValEmpName.setText(ename);SearchValEmpDOB.setText(dob);
                SearchValEmpSex.setText(sex);SearchValEmpDesignation.setText(designation);SearchValEmpBasic.setText(basic);
                SearchValEmpDA.setText(da);SearchValEmpHRA.setText(hra);SearchValEmpGross.setText(gross);
                SearchValEmpPF.setText(pf);SearchValEmpMC.setText(mc);SearchValEmpTotDeduc.setText(tot_deduc);
                SearchValEmpNetPay.setText(net_pay);
            }
        }
        catch(Exception e){
            System.err.println("Search Exception!");
            System.err.println(e.getMessage());
            JOptionPane.showMessageDialog(this, "Unable to Search. ", "Search Error", ERROR_MESSAGE);
        }
        finally{
            searchEmpID.setText("");
        }
    }//GEN-LAST:event_searchButtonActionPerformed

    private void searchEmpIDActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_searchEmpIDActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_searchEmpIDActionPerformed

    private void delButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_delButtonActionPerformed
        // TODO add your handling code here:
        try{
            
            if(delEmpID.getText().isEmpty()){
                JOptionPane.showMessageDialog(this, "Missing EmpID value", "Value Error", ERROR_MESSAGE);
                throw new Exception();
            }

            int eid = Integer.parseInt(delEmpID.getText());
            int count = 0;

            PreparedStatement check_stmt = conn.prepareStatement("SELECT * FROM Employee_Payroll WHERE eid = ?");
            check_stmt.setInt(1, eid);

            ResultSet rs = check_stmt.executeQuery();

            while(rs.next()){
                count += 1;
            }

            if(count == 0){
                JOptionPane.showMessageDialog(this, "Employee Record not found", "Delete Error", ERROR_MESSAGE);
                throw new Exception();
            }

            PreparedStatement del_stmt = conn.prepareStatement("DELETE FROM Employee_Payroll WHERE eid = ?");
            del_stmt.setInt(1, eid);
            del_stmt.executeUpdate();

            JOptionPane.showMessageDialog(this, "Employee Record Deleted!", "Delete Success", INFORMATION_MESSAGE);
        }
        catch(Exception e){
            System.err.println("Delete Exception! ");
            System.err.println(e.getMessage());
            JOptionPane.showMessageDialog(this, "Unable to Delete. ", "Delete Error", ERROR_MESSAGE);
        }
        finally{
            delEmpID.setText("");
        }
    }//GEN-LAST:event_delButtonActionPerformed

    private void updEmpSexActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_updEmpSexActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_updEmpSexActionPerformed

    private void updButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_updButtonActionPerformed
        // TODO add your handling code here:
        try {
            
            if(updEmpID.getText().isEmpty()){
                JOptionPane.showMessageDialog(this, "Missing EmpID value", "Value Error", ERROR_MESSAGE);
                throw new Exception();
            }
            if(updEmpName.getText().isEmpty()){
                JOptionPane.showMessageDialog(this, "Missing EmpName value", "Value Error", ERROR_MESSAGE);
                throw new Exception();
            }
            if(updEmpDOB.getText().isEmpty()){
                JOptionPane.showMessageDialog(this, "Missing EmpDOB value", "Value Error", ERROR_MESSAGE);
                throw new Exception();
            }
            if(updEmpSex.getText().isEmpty()){
                JOptionPane.showMessageDialog(this, "Missing EmpSex value", "Value Error", ERROR_MESSAGE);
                throw new Exception();
            }
            if(updEmpDesignation.getText().isEmpty()){
                JOptionPane.showMessageDialog(this, "Missing EmpDesignation value", "Value Error", ERROR_MESSAGE);
                throw new Exception();
            }
            if(updEmpBasic.getText().isEmpty()){
                JOptionPane.showMessageDialog(this, "Missing EmpBasic value", "Value Error", ERROR_MESSAGE);
                throw new Exception();
            }

            int eid = Integer.parseInt(updEmpID.getText());
            String ename = updEmpName.getText();
            String dob = updEmpDOB.getText();
            String sex = updEmpSex.getText();
            String designation = updEmpDesignation.getText();
            Float basic = Float.parseFloat(updEmpBasic.getText());

            PreparedStatement ps = conn.prepareStatement("UPDATE Employee_Payroll SET ename = ?, dob = ?, sex = ?, designation = ?, basic = ? WHERE eid = ?");
            ps.setString(1, ename);
            ps.setString(2, dob);
            ps.setString(3, sex);
            ps.setString(4, designation);
            ps.setFloat(5, basic);
            ps.setInt(6, eid);
            ps.executeUpdate();

            CallableStatement cs = conn.prepareCall("{call calculations(?,?)}");
            cs.setInt(1,eid);
            cs.setFloat(2,basic);
            cs.executeUpdate();

            JOptionPane.showMessageDialog(this, "Employee Updated!", "Update Success", INFORMATION_MESSAGE);

        } catch (Exception e) {
            System.err.println("Update Exception! ");
            System.err.println(e.getMessage());
            JOptionPane.showMessageDialog(this, "Unable to update", "Update Error", ERROR_MESSAGE);
        }
        finally{
            updEmpID.setText("");
            updEmpName.setText("");
            updEmpDOB.setText("");
            updEmpSex.setText("");
            updEmpDesignation.setText("");
            updEmpBasic.setText("");
        }
    }//GEN-LAST:event_updButtonActionPerformed

    private void insEmpBasicActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_insEmpBasicActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_insEmpBasicActionPerformed

    private void insEmpDesignationActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_insEmpDesignationActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_insEmpDesignationActionPerformed

    private void insEmpDOBActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_insEmpDOBActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_insEmpDOBActionPerformed

    private void insButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_insButtonActionPerformed
        // TODO add your handling code here:
        try {

            if(insEmpID.getText().isEmpty()){
                JOptionPane.showMessageDialog(this, "Missing EmpID value", "Value Error", ERROR_MESSAGE);
                throw new Exception();
            }
            if(insEmpName.getText().isEmpty()){
                JOptionPane.showMessageDialog(this, "Missing EmpName value", "Value Error", ERROR_MESSAGE);
                throw new Exception();
            }
            if(insEmpDOB.getText().isEmpty()){
                JOptionPane.showMessageDialog(this, "Missing EmpDOB value", "Value Error", ERROR_MESSAGE);
                throw new Exception();
            }
            if(insEmpSex.getText().isEmpty()){
                JOptionPane.showMessageDialog(this, "Missing EmpSex value", "Value Error", ERROR_MESSAGE);
                throw new Exception();
            }
            if(insEmpDesignation.getText().isEmpty()){
                JOptionPane.showMessageDialog(this, "Missing EmpDesignation value", "Value Error", ERROR_MESSAGE);
                throw new Exception();
            }
            if(insEmpBasic.getText().isEmpty()){
                JOptionPane.showMessageDialog(this, "Missing EmpBasic value", "Value Error", ERROR_MESSAGE);
                throw new Exception();
            }

            int eid = Integer.parseInt(insEmpID.getText());
            String ename = insEmpName.getText();
            String dob = insEmpDOB.getText();
            String sex = insEmpSex.getText();
            String des = insEmpDesignation.getText();
            Float basic = Float.parseFloat(insEmpBasic.getText());

            PreparedStatement ps = conn.prepareStatement("INSERT INTO Employee_Payroll(eid, ename, dob, sex, designation, basic) VALUES(?, ?, ?, ?, ?, ?)");
            ps.setInt(1, eid);
            ps.setString(2, ename);
            ps.setString(3, dob);
            ps.setString(4, sex);
            ps.setString(5, des);
            ps.setFloat(6, basic);
            ps.executeUpdate();

            CallableStatement cs = conn.prepareCall("{call calculations(?, ?)}");
            cs.setInt(1, eid);
            cs.setFloat(2, basic);
            cs.executeUpdate();
            JOptionPane.showMessageDialog(this, "Employee Inserted!", "Insert Success", INFORMATION_MESSAGE);

        } catch (Exception e) {
            System.err.println("Insert Exception! ");
            System.err.println(e.getMessage());
            JOptionPane.showMessageDialog(this, "Unable to Insert", "Insert Error", ERROR_MESSAGE);
        }
        finally{
            insEmpID.setText("");
            insEmpName.setText("");
            insEmpDOB.setText("");
            insEmpSex.setText("");
            insEmpDesignation.setText("");
            insEmpBasic.setText("");
        }
    }//GEN-LAST:event_insButtonActionPerformed

    private void SearchValEmpNameActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_SearchValEmpNameActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_SearchValEmpNameActionPerformed

    private void SearchValEmpDesignationActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_SearchValEmpDesignationActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_SearchValEmpDesignationActionPerformed

    private void SearchValEmpSexActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_SearchValEmpSexActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_SearchValEmpSexActionPerformed

    private void SearchValEmpBasicActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_SearchValEmpBasicActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_SearchValEmpBasicActionPerformed

    private void SearchValEmpNetPayActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_SearchValEmpNetPayActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_SearchValEmpNetPayActionPerformed

    private void SearchValEmpHRAActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_SearchValEmpHRAActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_SearchValEmpHRAActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(PayrollUI.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(PayrollUI.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(PayrollUI.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(PayrollUI.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new PayrollUI().setVisible(true);
            }
        });
        
        PayrollUI app = new PayrollUI();
        app.setVisible(true);
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel AppLabel;
    private javax.swing.JTabbedPane DisplayTab;
    private javax.swing.JTextField SearchValEmpBasic;
    private javax.swing.JTextField SearchValEmpDA;
    private javax.swing.JTextField SearchValEmpDOB;
    private javax.swing.JTextField SearchValEmpDesignation;
    private javax.swing.JTextField SearchValEmpGross;
    private javax.swing.JTextField SearchValEmpHRA;
    private javax.swing.JTextField SearchValEmpID;
    private javax.swing.JTextField SearchValEmpMC;
    private javax.swing.JTextField SearchValEmpName;
    private javax.swing.JTextField SearchValEmpNetPay;
    private javax.swing.JTextField SearchValEmpPF;
    private javax.swing.JTextField SearchValEmpSex;
    private javax.swing.JTextField SearchValEmpTotDeduc;
    private javax.swing.JButton delButton;
    private javax.swing.JTextField delEmpID;
    private javax.swing.JButton insButton;
    private javax.swing.JTextField insEmpBasic;
    private javax.swing.JTextField insEmpDOB;
    private javax.swing.JTextField insEmpDesignation;
    private javax.swing.JTextField insEmpID;
    private javax.swing.JTextField insEmpName;
    private javax.swing.JTextField insEmpSex;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel12;
    private javax.swing.JLabel jLabel13;
    private javax.swing.JLabel jLabel14;
    private javax.swing.JLabel jLabel15;
    private javax.swing.JLabel jLabel16;
    private javax.swing.JLabel jLabel17;
    private javax.swing.JLabel jLabel18;
    private javax.swing.JLabel jLabel19;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel20;
    private javax.swing.JLabel jLabel21;
    private javax.swing.JLabel jLabel22;
    private javax.swing.JLabel jLabel23;
    private javax.swing.JLabel jLabel24;
    private javax.swing.JLabel jLabel25;
    private javax.swing.JLabel jLabel26;
    private javax.swing.JLabel jLabel27;
    private javax.swing.JLabel jLabel28;
    private javax.swing.JLabel jLabel29;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel30;
    private javax.swing.JLabel jLabel31;
    private javax.swing.JLabel jLabel32;
    private javax.swing.JLabel jLabel33;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JPanel jPanel5;
    private javax.swing.JPanel jPanel6;
    private javax.swing.JPanel jPanel7;
    private javax.swing.JButton searchButton;
    private javax.swing.JTextField searchEmpID;
    private javax.swing.JButton updButton;
    private javax.swing.JTextField updEmpBasic;
    private javax.swing.JTextField updEmpDOB;
    private javax.swing.JTextField updEmpDesignation;
    private javax.swing.JTextField updEmpID;
    private javax.swing.JTextField updEmpName;
    private javax.swing.JTextField updEmpSex;
    // End of variables declaration//GEN-END:variables
}
