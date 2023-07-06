package aplicacao;

import java.awt.Color;
import java.awt.Component;
import java.text.ParseException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.ListSelectionModel;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import pessoa.sql.DAO.DAO;
import pessoa.sql.Pessoa;

public class frm_principal extends javax.swing.JFrame {

    private final DefaultTableModel modelo;
    private DAO pdao = new DAO();

    public frm_principal() {
        initComponents();
        this.tblPessoa.setModel(new javax.swing.table.DefaultTableModel() {

            boolean[] canEdit = new boolean[]{
                false, false, false,};

            @Override
            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit[columnIndex];
            }
        });
        tblPessoa.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);

        modelo = (DefaultTableModel) tblPessoa.getModel();
        modelo.addColumn("Código");
        modelo.addColumn("Nome");
        modelo.addColumn("Data de Nascimento");

        tblPessoa.setDefaultRenderer(Object.class, new DefaultTableCellRenderer() {
            @Override
            public Component getTableCellRendererComponent(JTable table, Object value,
                    boolean isSelected, boolean hasFocus, int row, int column) {
                super.getTableCellRendererComponent(table, value, isSelected,
                        hasFocus, row, column);
                if (row % 2 == 1) {
                    setBackground(Color.GREEN);
                } else {
                    setBackground(Color.CYAN);
                }
                return this;
            }
        });

    }

    private void preenherTabela() {
        modelo.getDataVector().clear();
        try {
            for (Pessoa pessoa : pdao.listar()) {
                modelo.addRow(new Object[]{pessoa.getcodigo(), pessoa.getnome(), pessoa.getData_nascimento()});

            }
        } catch (Exception e) {
            throw e;
        }
    }

    private void incluir() throws ParseException {
        new frm_pessoa(null).setVisible(true);
    }

    private void editar() {
        try {
            Integer codigo = (Integer) modelo.getValueAt(tblPessoa.getSelectedRow(), 0);
            String nome = (String) modelo.getValueAt(tblPessoa.getSelectedRow(), 1);
            Date Data_nascimento = (Date) modelo.getValueAt(tblPessoa.getSelectedRow(), 2);

            Pessoa pessoa = new Pessoa();
            pessoa.setcodigo(codigo);
            pessoa.setnome(nome);
            pessoa.setData_nascimento(Data_nascimento);

            new frm_pessoa(pessoa).setVisible(true);

        } catch (Exception e) {
            JOptionPane.showMessageDialog(this, "Por favor, selecionar a linha da tabela que deseja editar.");
        }
    }

    private void apagar() {
        try {
            Integer codigo = (Integer) modelo.getValueAt(tblPessoa.getSelectedRow(), 0);

            int linha = pdao.apagar(codigo);
            if (linha > 0) {
                modelo.removeRow(tblPessoa.getSelectedRow());
                JOptionPane.showMessageDialog(this, "Item excluído com sucesso!");
            } else {
                JOptionPane.showMessageDialog(this, "Erro ao excluir.");
            }

        } catch (Exception e) {
            JOptionPane.showMessageDialog(this, "Por favor, selecionar uma linha da tabela");
        }
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane2 = new javax.swing.JScrollPane();
        jTable2 = new javax.swing.JTable();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblPessoa = new javax.swing.JTable();
        btnIncluir = new javax.swing.JButton();
        btnApagar = new javax.swing.JButton();
        btnEditar = new javax.swing.JButton();
        btnSair = new javax.swing.JButton();

        jTable2.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Title 1", "Title 2", "Title 3", "Title 4"
            }
        ));
        jScrollPane2.setViewportView(jTable2);

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        addWindowFocusListener(new java.awt.event.WindowFocusListener() {
            public void windowGainedFocus(java.awt.event.WindowEvent evt) {
                formWindowGainedFocus(evt);
            }
            public void windowLostFocus(java.awt.event.WindowEvent evt) {
            }
        });

        tblPessoa.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {},
                {},
                {},
                {}
            },
            new String [] {

            }
        ));
        jScrollPane1.setViewportView(tblPessoa);

        btnIncluir.setText("Incluir");
        btnIncluir.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                btnIncluirFocusGained(evt);
            }
        });
        btnIncluir.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnIncluirActionPerformed(evt);
            }
        });

        btnApagar.setText("Apagar");
        btnApagar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnApagarActionPerformed(evt);
            }
        });

        btnEditar.setText("Editar");
        btnEditar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnEditarActionPerformed(evt);
            }
        });

        btnSair.setText("Sair");
        btnSair.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSairActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(66, 66, 66)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(btnIncluir)
                        .addGap(18, 18, 18)
                        .addComponent(btnEditar)
                        .addGap(18, 18, 18)
                        .addComponent(btnApagar)
                        .addGap(18, 18, 18)
                        .addComponent(btnSair, javax.swing.GroupLayout.PREFERRED_SIZE, 101, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 297, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(68, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap(58, Short.MAX_VALUE)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 191, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(54, 54, 54)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnIncluir)
                    .addComponent(btnEditar)
                    .addComponent(btnApagar)
                    .addComponent(btnSair))
                .addGap(19, 19, 19))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnIncluirActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnIncluirActionPerformed
        try {
            incluir();
        } catch (ParseException ex) {
            Logger.getLogger(frm_principal.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_btnIncluirActionPerformed

    private void formWindowGainedFocus(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowGainedFocus
        this.preenherTabela();

    }//GEN-LAST:event_formWindowGainedFocus

    private void btnIncluirFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_btnIncluirFocusGained
        // TODO add your handling code here:
    }//GEN-LAST:event_btnIncluirFocusGained

    private void btnEditarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnEditarActionPerformed
        editar();
    }//GEN-LAST:event_btnEditarActionPerformed

    private void btnApagarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnApagarActionPerformed
        Object[] opcao = {"Não", "Sim"};
        int opcaoSelecionada = JOptionPane.showOptionDialog(this, "Deseja realmente apagar?", "Aviso",
                JOptionPane.DEFAULT_OPTION, JOptionPane.WARNING_MESSAGE, null, opcao, opcao[0]);
        if (opcaoSelecionada == 1) {
            apagar();
    }//GEN-LAST:event_btnApagarActionPerformed
    }
    private void btnSairActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSairActionPerformed
        Object[] opcao = {"Não", "Sim"};
        int opcaoSelecionada = JOptionPane.showOptionDialog(this, "Deseja realmente sair?", "Aviso",
                JOptionPane.DEFAULT_OPTION, JOptionPane.WARNING_MESSAGE, null, opcao, opcao[0]);
        if (opcaoSelecionada == 1) {
            System.exit(0);
        }
    }//GEN-LAST:event_btnSairActionPerformed

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
            java.util.logging.Logger.getLogger(frm_principal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(frm_principal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(frm_principal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(frm_principal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new frm_principal().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnApagar;
    private javax.swing.JButton btnEditar;
    private javax.swing.JButton btnIncluir;
    private javax.swing.JButton btnSair;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTable jTable2;
    private javax.swing.JTable tblPessoa;
    // End of variables declaration//GEN-END:variables
}
