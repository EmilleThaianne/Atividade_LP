package aplicacao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.text.MaskFormatter;
import pessoa.sql.DAO.DAO;
import pessoa.sql.Pessoa;

public class frm_pessoa extends javax.swing.JFrame {

    Date Data_nascimento;
    DAO pessoaDAO = new DAO();
    Pessoa pessoa;

    public frm_pessoa(Pessoa pessoa) throws ParseException {
        initComponents();
        this.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        MaskFormatter mascaraData = new MaskFormatter("##/##/####");
        mascaraData.install(txtDatanascimento);

        this.pessoa = pessoa;
        if (this.pessoa != null) {
            SimpleDateFormat teste = new SimpleDateFormat("dd/MM/yyyy");
            String data = teste.format(this.pessoa.getData_nascimento());

            txtNome.setText(this.pessoa.getnome());
            txtDatanascimento.setText(data);
        }
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        lbNome = new javax.swing.JLabel();
        lbDatanascimento = new javax.swing.JLabel();
        txtNome = new javax.swing.JTextField();
        btnInserir = new javax.swing.JButton();
        btnCancelar = new javax.swing.JButton();
        txtDatanascimento = new javax.swing.JFormattedTextField();

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
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
        jScrollPane1.setViewportView(jTable1);

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        lbNome.setText("Nome");

        lbDatanascimento.setText("Data de Nascimento");
        lbDatanascimento.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                lbDatanascimentoFocusGained(evt);
            }
        });

        txtNome.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtNomeActionPerformed(evt);
            }
        });

        btnInserir.setText("Inserir");

        btnCancelar.setText("Cancelar");

        txtDatanascimento.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                txtDatanascimentoFocusGained(evt);
            }
            public void focusLost(java.awt.event.FocusEvent evt) {
                txtDatanascimentoFocusLost(evt);
            }
        });
        txtDatanascimento.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtDatanascimentoActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(83, 83, 83)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(lbNome)
                        .addGap(18, 18, 18)
                        .addComponent(txtNome, javax.swing.GroupLayout.PREFERRED_SIZE, 210, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(lbDatanascimento)
                            .addComponent(btnInserir, javax.swing.GroupLayout.PREFERRED_SIZE, 85, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addGap(18, 18, Short.MAX_VALUE)
                                .addComponent(btnCancelar, javax.swing.GroupLayout.PREFERRED_SIZE, 85, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                            .addGroup(layout.createSequentialGroup()
                                .addGap(18, 18, 18)
                                .addComponent(txtDatanascimento)))))
                .addGap(55, 55, 55))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap(77, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(lbNome)
                    .addComponent(txtNome, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(28, 28, 28)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(lbDatanascimento)
                    .addComponent(txtDatanascimento, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(69, 69, 69)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnInserir)
                    .addComponent(btnCancelar))
                .addGap(58, 58, 58))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void txtNomeActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtNomeActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtNomeActionPerformed

    private void txtDatanascimentoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtDatanascimentoActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtDatanascimentoActionPerformed

    private void lbDatanascimentoFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_lbDatanascimentoFocusGained
        // TODO add your handling code here:
    }//GEN-LAST:event_lbDatanascimentoFocusGained

    private void txtDatanascimentoFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txtDatanascimentoFocusGained

    }//GEN-LAST:event_txtDatanascimentoFocusGained

    private void txtDatanascimentoFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_txtDatanascimentoFocusLost
        SimpleDateFormat teste = new SimpleDateFormat("dd/MM/yyyy");
        teste.setLenient(false);
        try {
            Data_nascimento = teste.parse(txtDatanascimento.getText());
        } catch (Exception e) {
            JOptionPane.showMessageDialog(this, "Data Inválida!");
        }


    }//GEN-LAST:event_txtDatanascimentoFocusLost


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnCancelar;
    private javax.swing.JButton btnInserir;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable1;
    private javax.swing.JLabel lbDatanascimento;
    private javax.swing.JLabel lbNome;
    private javax.swing.JFormattedTextField txtDatanascimento;
    private javax.swing.JTextField txtNome;
    // End of variables declaration//GEN-END:variables
}
