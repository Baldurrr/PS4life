# Script shifumi (REYNAUD William)

$start = 0

While( $start -eq 0)
{
    [int]$input_mode= Read-Host ("JvsJ: tapez 1, JvsOrdi tapez 2, 0 pour quitter `n")

    $compteur_round=0
    $nbmatch_nul=0
    $score_joueur1=0
    $score_joueur2=0
    $score_ordi=0

    If ($input_mode -eq 1)
    { 
        [int]$input_round = Read-Host ("Entrez un nombre de manches : (Max = 10)`n")
        $nbround = $input_round

        If ($input_round -gt 10)
        {
            Write-Host ("Nombre de round trop grand")
            Write-Host ("Round: entre 1 et 10 max `n")
            $start=1
        } 

        Else
        {
            While ($compteur_round -lt $nbround)
            {
               Write-Host ("## 0=pierre ; 1=feuille ; 2=ciseaux ##`n")
               
               [int]$input_joueur1 = Read-Host ("Votre numero J1 : ")
               [int]$input_joueur2 = Read-Host ("Votre numero J2 : ")

               If ($input_joueur1 -eq $input_joueur2)
               {
                   Write-Host ("Match nul `n")
                   $nbmatch_nul=$nbmatch_nul+1
               }

               ElseIf (($input_joueur1 -gt 2) -or ($input_joueur2 -gt 2))
				{
                    Write-Host("`nNombre non valide")
                    Write-Host("Veuillez recommencer`n")
				}
               Else
               {
				If ($input_joueur1 -eq 0)
                {
                    If ($input_joueur2 -eq 2)
					{
						  Write-Host("`nJoueur1 gagne `n")
						  $score_joueur1=$score_joueur1+1
					}  
                     Else
                    {
						 Write-Host("`nJoueur2 gagne `n")
						 $score_joueur2=$score_joueur2+1
                    }     
                }
				
				ElseIf ($input_joueur1 -eq 1)
				{
					If ($input_joueur2 -eq 0)
						{
						   Write-Host("`nJoueur1 gagne `n")
						   $score_joueur1=$score_joueur1+1               
						}
						Else
						{
						   Write-Host("`nJoueur2 gagne `n")
						   $score_joueur2=$score_joueur2+1
						}
				}
					
                ElseIf($input_joueur1 -eq 2)
				{
					if ($input_joueur2 -eq 1)
					{
						Write-Host("`nJoueur1 gagne `n")
						$score_joueur1=$score_joueur1+1
					}
					Else
					{
						Write-Host("`nJoueur2 gagne `n")
						$score_joueur2=$score_joueur2+1
					}
               
               }
               $compteur_round = $compteur_round +1 
             }
           }
          Write-Host("## Tableau des scores ##")           
          Write-Host("score joueur1 : " + [string]($score_joueur1))
          Write-Host("score joueur2 : " + [string]($score_joueur2))
          Write-Host("Nombre match nul : " +[string]($nbmatch_nul))
          Write-Host("`n")
        }
    }

    ElseIf($input_mode -eq 2)
    {
        [int]$input_round =Read-Host ("Entrez un nombre de manches : (Max = 10)`n")
        $nbround = $input_round

        If ($input_round -gt 10)
        {
            Write-Host ("Nombre de round trop grand")
            Write-Host ("Round: entre 1 et 10 max `n")
            $start=1
        }
        Else
        {
        While ($compteur_round -lt $nbround)
        {
           Write-Host ("## 0=pierre ; 1=feuille ; 2=ciseaux ##`n")
           
           $input_joueur1 = Read-Host ("Votre numero: ")
           $input_ordi = Get-Random -Minimum 0 -Maximum 3

           Write-Host("Num ordi : " +[string]($input_ordi))

           If($input_joueur1 -eq $input_ordi)
           {
			   Write-Host("`nMatch nul `n")
			   $nbmatch_nul=$nbmatch_nul+1
           }
           ElseIf($input_joueur1 -gt 2)
           {
			   Write-Host("`nNombre non valide")
			   Write-Host("Veuillez recommencer`n")
           }
           Else
           {
			If ($input_joueur1 -eq 0)
			{
				If ($input_ordi -eq 2)
				{
				   Write-Host("`nJoueur gagne `n")
				   $score_joueur1=$score_joueur1+1
				}
				Else
				{
					Write-Host("`nOrdi gagne `n")
					$score_ordi=$score_ordi+1
				}
            }
			
           ElseIf($input_joueur1 -eq 1)
            {
				If ($input_ordi -eq 0)
				{
					Write-Host("`nJoueur gagne `n")
					$score_joueur1=$score_joueur1+1
				}
				Else
				{
					Write-Host("`nOrdi gagne `n")
					$score_ordi=$score_ordi+1
				}
           }
		   
           ElseIf ($input_joueur1 -eq 2)
           {
				If ($input_ordi -eq 1)
				{
					Write-Host("`nJoueur gagne `n")
					$score_joueur1=$score_joueur1+1
				}
				Else
				{
					Write-Host("`nOrdi gagne `n")
					$score_ordi=$score_ordi+1
				}
          }
          $compteur_round = $compteur_round +1 
         }

        }
        Write-Host("## Tableau des scores ##")
        Write-Host("score joueur1 : " + [string]($score_joueur1))
        Write-Host("Score ordi : " + [string]($score_ordi))
        Write-Host("Nombre match nul : " +[string]($nbmatch_nul))
        Write-Host("`n")
       }
    }


    ElseIf($input_mode -eq 0)
    {
		Write-Host("`nA plus dans le bus `n")
		$start=1
    }
    Else 
    {
		Write-Host("Entrez un numéro valide `n")
		$start=1
    }

}
    
