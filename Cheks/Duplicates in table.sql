select  * from PartnersMedia pm
inner join PartnersMedia pm2
on pm.id = pm2.id 
and pm.idPartner <>pm2.idPartner and pm.Modified > pm2.Modified