select [��� �������] = o.name, 
       [��� ������������] = user_name(o.uid),
       [���� ��������] = o.crdate
from   sysobjects o
where OBJECTPROPERTY(o.id, N'IsTable') = 1 
      and
      OBJECTPROPERTY(o.id, N'IsSystemTable')=0
      and
      OBJECTPROPERTY(o.id, N'IsMSShipped')!=1
      and 
      o.name not like N'#%'   
order by [��� �������]