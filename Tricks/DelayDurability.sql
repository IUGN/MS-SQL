https://habrahabr.ru/post/303156/

��� ��� ��������� ������ � ��� ���������� ������, ����� Log Buffer ��������� ��������. �������� Delayed Durability ����� ��� ���� ����:

ALTER DATABASE TT SET DELAYED_DURABILITY = FORCED
GO

��� ��� ��������� ����������:

ALTER DATABASE TT SET DELAYED_DURABILITY = ALLOWED
GO

BEGIN TRANSACTION t
...
COMMIT TRANSACTION t WITH (DELAYED_DURABILITY = ON)