$tabuleiro=@([object[]](1,2,3),(4,5,6),(7,8,9)) 
function tabuleiro{
    Clear-Host
    Write-Host "`nJogo do Galo`n"
    for ($i = 0; $i -lt $tabuleiro.Length; $i++){
        if ($i -gt 0) {
            Write-Host "-----" 
        }
        Write-Host $tabuleiro[$i];        
    }    
}                    
function jogador{
    if  ((-not($tabuleiro[0] -ne "x")) -or
        (-not($tabuleiro[1] -ne "x")) -or
        (-not($tabuleiro[2] -ne "x")) -or
        (($tabuleiro[0][0] -eq "x") -and ($tabuleiro[1][0] -eq "x") -and ($tabuleiro[2][0] -eq "x")) -or
        (($tabuleiro[0][1] -eq "x") -and ($tabuleiro[1][1] -eq "x") -and ($tabuleiro[2][1] -eq "x")) -or
        (($tabuleiro[0][2] -eq "x") -and ($tabuleiro[1][2] -eq "x") -and ($tabuleiro[2][2] -eq "x")) -or
        (($tabuleiro[0][0] -eq "x") -and ($tabuleiro[1][1] -eq "x") -and ($tabuleiro[2][2] -eq "x")) -or
        (($tabuleiro[0][2] -eq "x") -and ($tabuleiro[1][1] -eq "x") -and ($tabuleiro[2][0] -eq "x"))) {
            tabuleiro
            start-sleep -Milliseconds 500
            Write-Host "`nJogador -> X |GANHOU|`n" -ForegroundColor "green"
            sair
            $tabuleiro=@([object[]](1,2,3),(4,5,6),(7,8,9))
            programa
        }                
    elseif ((-not($tabuleiro[0] -ne "o")) -or 
            (-not($tabuleiro[1] -ne "o")) -or
            (-not($tabuleiro[2] -ne "o")) -or
            (($tabuleiro[0][0] -eq "o") -and ($tabuleiro[1][0] -eq "o") -and ($tabuleiro[2][0] -eq "o")) -or
            (($tabuleiro[0][1] -eq "o") -and ($tabuleiro[1][1] -eq "o") -and ($tabuleiro[2][1] -eq "o")) -or
            (($tabuleiro[0][2] -eq "o") -and ($tabuleiro[1][2] -eq "o") -and ($tabuleiro[2][2] -eq "o")) -or
            (($tabuleiro[0][0] -eq "o") -and ($tabuleiro[1][1] -eq "o") -and ($tabuleiro[2][2] -eq "o")) -or
            (($tabuleiro[0][2] -eq "o") -and ($tabuleiro[1][1] -eq "o") -and ($tabuleiro[2][0] -eq "o"))) {
            tabuleiro    
            start-sleep -Milliseconds 500
            Write-Host "`nJogador -> O |GANHOU|" -ForegroundColor "green"
            sair
            $tabuleiro=@([object[]](1,2,3),(4,5,6),(7,8,9)) 
            programa
        }
    elseif (($tabuleiro[0] -notcontains 1) -and ($tabuleiro[0] -notcontains 2) -and ($tabuleiro[0] -notcontains 3) -and
            ($tabuleiro[1] -notcontains 4) -and ($tabuleiro[1] -notcontains 5) -and ($tabuleiro[1] -notcontains 6) -and
            ($tabuleiro[2] -notcontains 7) -and ($tabuleiro[2] -notcontains 8) -and ($tabuleiro[2] -notcontains 9)) {
            tabuleiro
            start-sleep -Milliseconds 500
            Write-Host "`nEmpatado" -ForegroundColor "yellow"
            sair
            $tabuleiro=@([object[]](1,2,3),(4,5,6),(7,8,9)) 
            programa
        }
}
function pause {Read-Host "ENTER - Continuar"} 
function sair { $sair = Read-Host "Continuar...Enter ou Sair do Jogo [S] ? Para SAIR, S depois ENTER "    
    switch ($sair) {
        C { continue }
        S { Read-Host "A sair...ENTER"; exit }
    } 
}
# Programa começa aqui---------------------------------------------------------------------------------------------
function programa{
do {
tabuleiro
$x = Read-Host "`nIntroduza X ou O "

if (($x -ne "x") -and ($x -ne "o")) {         
    Write-Host "Tecla ERRADA"  
    pause    
}

if (($x -eq "x") -or ($x -eq "o")) {
        $y = Read-Host "Introduza o numero "
        switch ($y) {
                1 {if (($tabuleiro[0][0] -eq "x") -or ($tabuleiro[0][0] -eq "o")){
                    Write-Host "Está ocupado"
                    pause
                    $y} else {$tabuleiro[0][0] = $x}
                }
                2 {if (($tabuleiro[0][1] -eq "x") -or ($tabuleiro[0][1] -eq "o")){
                    Write-Host "Está ocupado"
                    pause
                    $y} else {$tabuleiro[0][1] = $x}
                }    
                3 {if (($tabuleiro[0][2] -eq "x") -or ($tabuleiro[0][2] -eq "o")){
                    Write-Host "Está ocupado"
                    pause
                    $y} else {$tabuleiro[0][2] = $x}
                }
                4 {if (($tabuleiro[1][0] -eq "x") -or ($tabuleiro[1][0] -eq "o")){
                    Write-Host "Está ocupado"
                    pause
                    $y} else {$tabuleiro[1][0] = $x}
                }
                5 {if (($tabuleiro[1][1] -eq "x") -or ($tabuleiro[1][1] -eq "o")){
                    Write-Host "Está ocupado"
                    pause
                    $y} else {$tabuleiro[1][1] = $x}
                }
                6 {if (($tabuleiro[1][2] -eq "x") -or ($tabuleiro[1][2] -eq "o")){
                    Write-Host "Está ocupado"
                    pause
                    $y} else {$tabuleiro[1][2] = $x}
                }
                7 {if (($tabuleiro[2][0] -eq "x") -or ($tabuleiro[2][0] -eq "o")){
                    Write-Host "Está ocupado"
                    pause
                    $y} else {$tabuleiro[2][0] = $x}
                }
                8 {if (($tabuleiro[2][1] -eq "x") -or ($tabuleiro[2][1] -eq "o")){
                    Write-Host "Está ocupado"
                    pause
                    $y} else {$tabuleiro[2][1] = $x}
                }
                9 {if (($tabuleiro[2][2] -eq "x") -or ($tabuleiro[2][2] -eq "o")){
                    Write-Host "Está ocupado"
                    pause
                    $y} else {$tabuleiro[2][2] = $x}
                }                                       
        }          
    } 
} until(jogador)
}
programa