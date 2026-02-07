Add-Type -AssemblyName System.Windows.Forms
$f = New-Object Windows.Forms.Form
$f.Text = "Automacao CAU - Walace Gomes"; $f.Size = "360,420"; $f.StartPosition = "CenterScreen"; $f.BackColor = "WhiteSmoke"

# --- AREA DE ENTRADA ---
$l = New-Object Windows.Forms.Label
$l.Text = "INSIRA A MATRICULA:"; $l.Location = "10,20"; $l.Font = "Segoe UI, 10, Bold"; $l.AutoSize = $true; $f.Controls.Add($l)

$i = New-Object Windows.Forms.TextBox
$i.Location = "10,45"; $i.Width = 160; $i.Font = "Segoe UI, 12"; $f.Controls.Add($i)

$btnBusca = New-Object Windows.Forms.Button
$btnBusca.Text = "PESQUISAR"; $btnBusca.Location = "180,43"; $btnBusca.Width = 110; $btnBusca.Height = 30; $btnBusca.FlatStyle = "Flat"
$btnBusca.Add_Click({
    try {
        $user = Get-ADUser -Identity $i.Text -Properties DisplayName
        $status.Text = "COLABORADOR: $($user.DisplayName)`nStatus: Pronto para atendimento."
        $status.ForeColor = "DarkBlue"
    } catch {
        $status.Text = "AVISO: ID nao localizado no sistema!"; $status.ForeColor = "DarkRed"
    }
})
$f.Controls.Add($btnBusca)

# --- AREA DE STATUS ---
$status = New-Object Windows.Forms.Label
$status.Text = "Aguardando identificacao..."; $status.Location = "10,95"; $status.Size = "320,60"; $status.Font = "Segoe UI, 9, Italic"; $f.Controls.Add($status)

# --- AREA DE ACOES ---
$b1 = New-Object Windows.Forms.Button
$b1.Text = "Desbloquear usuário"; $b1.Location = "10,170"; $b1.Width = 320; $b1.Height = 50
$b1.BackColor = "LightBlue"; $b1.Font = "Segoe UI, 10, Bold"; $b1.FlatStyle = "Flat"
$b1.Add_Click({ Unlock-ADAccount $i.Text; [Windows.Forms.MessageBox]::Show("Conta liberada com sucesso!") })
$f.Controls.Add($b1)

$b2 = New-Object Windows.Forms.Button
$b2.Text = "Desbloqueio e Reset de senha"; $b2.Location = "10,240"; $b2.Width = 320; $b2.Height = 50
$b2.BackColor = "LimeGreen"; $b2.Font = "Segoe UI, 10, Bold"; $b2.FlatStyle = "Flat"; $b2.ForeColor = "Black"
$b2.Add_Click({ 
    $p = ConvertTo-SecureString "Mudar@123" -AsPlainText -Force
    Unlock-ADAccount $i.Text; Set-ADAccountPassword $i.Text -NewPassword $p; Set-ADUser $i.Text -ChangePasswordAtLogon $true
    [Windows.Forms.MessageBox]::Show("Senha resetada para: Mudar@123") 
})
$f.Controls.Add($b2)

$f.ShowDialog()