local armorUp ={ -- ��������
    multiSelectType=true,
    -- 1�� 2�� 3�� 4�� 5��
    -- �¼�,�¼�����,����ID,���߸���,������λ
    -- q����Ʒ�ʷ�����Ϊcolor,lv�����ĵȼ�
    [1]={
        OpenLevel=4,
        type=1,
        sortId=318,
        reward={
            {t={q=2,lv=30},r={am={{exp=2000,index=1}}}},
            {t={q=3,lv=20},r={am={{exp=2000,index=1}}}},
            {t={q=4,lv=15},r={am={{exp=2000,index=1}}}},
            {t={q=4,lv=30},r={am={{exp=10000,index=1}}}},
        },
        serverreward={
            {condition={color=2,lv=30},r={armor_exp=2000}},
            {condition={color=3,lv=20},r={armor_exp=2000}},
            {condition={color=4,lv=15},r={armor_exp=2000}},
            {condition={color=4,lv=30},r={armor_exp=10000}},
        },
    },
}
return armorUp 
