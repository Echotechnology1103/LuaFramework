

--�ʼ�����
function sendaskMailCount()
	sendAskMail(enum.MAIL_OPERATOR.MAIL_QUERY_COUNT,-1,-1)	
end

--�ʼ�list
function sendaskMaillList()
	sendAskMail(enum.MAIL_OPERATOR.MAIL_QUERY_LIST,-1,-1)		
end	

--���ʼ�
function sendaskMaillOpen(id)
	sendAskMail(enum.MAIL_OPERATOR.MAIL_READ_MAIL,id,-1)		
end	

--��ȡ���и���
function sendaskMaillGetItemAll(id)
	sendAskMail(enum.MAIL_OPERATOR.MAIL_GATHER_ATTACHMENTS,id,-1)		
end	

--ɾ���ʼ�
function sendaskMaillDelete(id)
	sendAskMail(enum.MAIL_OPERATOR.MAIL_DELETE_MAIL,id,-1)		
end	