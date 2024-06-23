use clinica_medica

create procedure Agenda_Medicos
as
begin

SELECT TOP (100) PERCENT dbo.medico.crm, dbo.medico.nome_medico, dbo.medico.especialidade, dbo.consulta.numero_consulta, dbo.consulta.data_consulta, dbo.consulta.horario_consulta, dbo.paciente.cpf, 
                         dbo.paciente.nome_paciente
FROM dbo.medico INNER JOIN
                         dbo.consulta ON dbo.medico.crm = dbo.consulta.fk_medico_crm INNER JOIN
                         dbo.paciente ON dbo.consulta.fk_paciente_cpf = dbo.paciente.cpf
ORDER BY dbo.medico.nome_medico, dbo.consulta.data_consulta

end

execute Agenda_Medicos;