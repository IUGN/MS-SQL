EXEC sp_help_agent_parameter
EXEC sp_help_agent_profile @agent_type = 3

��� ������.
1 = ����� ������������ �������.
2 = ����� ������ �������.
3 = ����� ����������������.
4 = ����� �������.
9 = ����� ������ �������.


DECLARE @profileid AS int;
EXEC sp_change_agent_parameter @profile_id = 9, 
    @parameter_name = N'-MaxBcpThreads', @parameter_value = 2;
    
    
EXEC sp_add_agent_parameter @profile_id = 1, @parameter_name = '-EncryptionLevel', @parameter_value = 0