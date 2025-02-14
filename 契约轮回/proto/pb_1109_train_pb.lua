-- Generated By protoc-gen-lua Do not Edit
local protobuf = require "tolua.protobuf/protobuf"
module('pb_1109_train_pb')


M_TRAIN_INFO_TOS = protobuf.Descriptor();
M_TRAIN_INFO_TOS_TYPE_FIELD = protobuf.FieldDescriptor();
M_TRAIN_INFO_TOC = protobuf.Descriptor();
M_TRAIN_INFO_TOC_TRAIN_FIELD = protobuf.FieldDescriptor();
M_TRAIN_UPGRADE_TOS = protobuf.Descriptor();
M_TRAIN_UPGRADE_TOS_TYPE_FIELD = protobuf.FieldDescriptor();
M_TRAIN_UPGRADE_TOS_ITEM_ID_FIELD = protobuf.FieldDescriptor();
M_TRAIN_UPGRADE_TOC = protobuf.Descriptor();
M_TRAIN_UPGRADE_TOC_TRAIN_FIELD = protobuf.FieldDescriptor();
M_TRAIN_FIGURE_TOS = protobuf.Descriptor();
M_TRAIN_FIGURE_TOS_TYPE_FIELD = protobuf.FieldDescriptor();
M_TRAIN_FIGURE_TOC = protobuf.Descriptor();
M_TRAIN_FIGURE_TOC_TYPE_FIELD = protobuf.FieldDescriptor();
M_TRAIN_ATTR_TOS = protobuf.Descriptor();
M_TRAIN_ATTR_TOS_TYPE_FIELD = protobuf.FieldDescriptor();
M_TRAIN_ATTR_TOS_ITEM_ID_FIELD = protobuf.FieldDescriptor();
M_TRAIN_ATTR_TOC = protobuf.Descriptor();
M_TRAIN_ATTR_TOC_TYPE_FIELD = protobuf.FieldDescriptor();
M_TRAIN_ATTR_TOC_ITEM_ID_FIELD = protobuf.FieldDescriptor();
M_TRAIN_ATTR_TOC_LEVEL_FIELD = protobuf.FieldDescriptor();
P_TRAIN = protobuf.Descriptor();
P_TRAIN_TRAINENTRY = protobuf.Descriptor();
P_TRAIN_TRAINENTRY_KEY_FIELD = protobuf.FieldDescriptor();
P_TRAIN_TRAINENTRY_VALUE_FIELD = protobuf.FieldDescriptor();
P_TRAIN_TYPE_FIELD = protobuf.FieldDescriptor();
P_TRAIN_LEVEL_FIELD = protobuf.FieldDescriptor();
P_TRAIN_EXP_FIELD = protobuf.FieldDescriptor();
P_TRAIN_TRAIN_FIELD = protobuf.FieldDescriptor();

M_TRAIN_INFO_TOS_TYPE_FIELD.name = "type"
M_TRAIN_INFO_TOS_TYPE_FIELD.full_name = ".m_train_info_tos.type"
M_TRAIN_INFO_TOS_TYPE_FIELD.number = 1
M_TRAIN_INFO_TOS_TYPE_FIELD.index = 0
M_TRAIN_INFO_TOS_TYPE_FIELD.label = 2
M_TRAIN_INFO_TOS_TYPE_FIELD.has_default_value = false
M_TRAIN_INFO_TOS_TYPE_FIELD.default_value = 0
M_TRAIN_INFO_TOS_TYPE_FIELD.type = 5
M_TRAIN_INFO_TOS_TYPE_FIELD.cpp_type = 1

M_TRAIN_INFO_TOS.name = "m_train_info_tos"
M_TRAIN_INFO_TOS.full_name = ".m_train_info_tos"
M_TRAIN_INFO_TOS.nested_types = {}
M_TRAIN_INFO_TOS.enum_types = {}
M_TRAIN_INFO_TOS.fields = {M_TRAIN_INFO_TOS_TYPE_FIELD}
M_TRAIN_INFO_TOS.is_extendable = false
M_TRAIN_INFO_TOS.extensions = {}
M_TRAIN_INFO_TOC_TRAIN_FIELD.name = "train"
M_TRAIN_INFO_TOC_TRAIN_FIELD.full_name = ".m_train_info_toc.train"
M_TRAIN_INFO_TOC_TRAIN_FIELD.number = 1
M_TRAIN_INFO_TOC_TRAIN_FIELD.index = 0
M_TRAIN_INFO_TOC_TRAIN_FIELD.label = 2
M_TRAIN_INFO_TOC_TRAIN_FIELD.has_default_value = false
M_TRAIN_INFO_TOC_TRAIN_FIELD.default_value = nil
M_TRAIN_INFO_TOC_TRAIN_FIELD.message_type = P_TRAIN
M_TRAIN_INFO_TOC_TRAIN_FIELD.type = 11
M_TRAIN_INFO_TOC_TRAIN_FIELD.cpp_type = 10

M_TRAIN_INFO_TOC.name = "m_train_info_toc"
M_TRAIN_INFO_TOC.full_name = ".m_train_info_toc"
M_TRAIN_INFO_TOC.nested_types = {}
M_TRAIN_INFO_TOC.enum_types = {}
M_TRAIN_INFO_TOC.fields = {M_TRAIN_INFO_TOC_TRAIN_FIELD}
M_TRAIN_INFO_TOC.is_extendable = false
M_TRAIN_INFO_TOC.extensions = {}
M_TRAIN_UPGRADE_TOS_TYPE_FIELD.name = "type"
M_TRAIN_UPGRADE_TOS_TYPE_FIELD.full_name = ".m_train_upgrade_tos.type"
M_TRAIN_UPGRADE_TOS_TYPE_FIELD.number = 1
M_TRAIN_UPGRADE_TOS_TYPE_FIELD.index = 0
M_TRAIN_UPGRADE_TOS_TYPE_FIELD.label = 2
M_TRAIN_UPGRADE_TOS_TYPE_FIELD.has_default_value = false
M_TRAIN_UPGRADE_TOS_TYPE_FIELD.default_value = 0
M_TRAIN_UPGRADE_TOS_TYPE_FIELD.type = 5
M_TRAIN_UPGRADE_TOS_TYPE_FIELD.cpp_type = 1

M_TRAIN_UPGRADE_TOS_ITEM_ID_FIELD.name = "item_id"
M_TRAIN_UPGRADE_TOS_ITEM_ID_FIELD.full_name = ".m_train_upgrade_tos.item_id"
M_TRAIN_UPGRADE_TOS_ITEM_ID_FIELD.number = 2
M_TRAIN_UPGRADE_TOS_ITEM_ID_FIELD.index = 1
M_TRAIN_UPGRADE_TOS_ITEM_ID_FIELD.label = 2
M_TRAIN_UPGRADE_TOS_ITEM_ID_FIELD.has_default_value = false
M_TRAIN_UPGRADE_TOS_ITEM_ID_FIELD.default_value = 0
M_TRAIN_UPGRADE_TOS_ITEM_ID_FIELD.type = 5
M_TRAIN_UPGRADE_TOS_ITEM_ID_FIELD.cpp_type = 1

M_TRAIN_UPGRADE_TOS.name = "m_train_upgrade_tos"
M_TRAIN_UPGRADE_TOS.full_name = ".m_train_upgrade_tos"
M_TRAIN_UPGRADE_TOS.nested_types = {}
M_TRAIN_UPGRADE_TOS.enum_types = {}
M_TRAIN_UPGRADE_TOS.fields = {M_TRAIN_UPGRADE_TOS_TYPE_FIELD, M_TRAIN_UPGRADE_TOS_ITEM_ID_FIELD}
M_TRAIN_UPGRADE_TOS.is_extendable = false
M_TRAIN_UPGRADE_TOS.extensions = {}
M_TRAIN_UPGRADE_TOC_TRAIN_FIELD.name = "train"
M_TRAIN_UPGRADE_TOC_TRAIN_FIELD.full_name = ".m_train_upgrade_toc.train"
M_TRAIN_UPGRADE_TOC_TRAIN_FIELD.number = 1
M_TRAIN_UPGRADE_TOC_TRAIN_FIELD.index = 0
M_TRAIN_UPGRADE_TOC_TRAIN_FIELD.label = 2
M_TRAIN_UPGRADE_TOC_TRAIN_FIELD.has_default_value = false
M_TRAIN_UPGRADE_TOC_TRAIN_FIELD.default_value = nil
M_TRAIN_UPGRADE_TOC_TRAIN_FIELD.message_type = P_TRAIN
M_TRAIN_UPGRADE_TOC_TRAIN_FIELD.type = 11
M_TRAIN_UPGRADE_TOC_TRAIN_FIELD.cpp_type = 10

M_TRAIN_UPGRADE_TOC.name = "m_train_upgrade_toc"
M_TRAIN_UPGRADE_TOC.full_name = ".m_train_upgrade_toc"
M_TRAIN_UPGRADE_TOC.nested_types = {}
M_TRAIN_UPGRADE_TOC.enum_types = {}
M_TRAIN_UPGRADE_TOC.fields = {M_TRAIN_UPGRADE_TOC_TRAIN_FIELD}
M_TRAIN_UPGRADE_TOC.is_extendable = false
M_TRAIN_UPGRADE_TOC.extensions = {}
M_TRAIN_FIGURE_TOS_TYPE_FIELD.name = "type"
M_TRAIN_FIGURE_TOS_TYPE_FIELD.full_name = ".m_train_figure_tos.type"
M_TRAIN_FIGURE_TOS_TYPE_FIELD.number = 1
M_TRAIN_FIGURE_TOS_TYPE_FIELD.index = 0
M_TRAIN_FIGURE_TOS_TYPE_FIELD.label = 2
M_TRAIN_FIGURE_TOS_TYPE_FIELD.has_default_value = false
M_TRAIN_FIGURE_TOS_TYPE_FIELD.default_value = 0
M_TRAIN_FIGURE_TOS_TYPE_FIELD.type = 5
M_TRAIN_FIGURE_TOS_TYPE_FIELD.cpp_type = 1

M_TRAIN_FIGURE_TOS.name = "m_train_figure_tos"
M_TRAIN_FIGURE_TOS.full_name = ".m_train_figure_tos"
M_TRAIN_FIGURE_TOS.nested_types = {}
M_TRAIN_FIGURE_TOS.enum_types = {}
M_TRAIN_FIGURE_TOS.fields = {M_TRAIN_FIGURE_TOS_TYPE_FIELD}
M_TRAIN_FIGURE_TOS.is_extendable = false
M_TRAIN_FIGURE_TOS.extensions = {}
M_TRAIN_FIGURE_TOC_TYPE_FIELD.name = "type"
M_TRAIN_FIGURE_TOC_TYPE_FIELD.full_name = ".m_train_figure_toc.type"
M_TRAIN_FIGURE_TOC_TYPE_FIELD.number = 1
M_TRAIN_FIGURE_TOC_TYPE_FIELD.index = 0
M_TRAIN_FIGURE_TOC_TYPE_FIELD.label = 2
M_TRAIN_FIGURE_TOC_TYPE_FIELD.has_default_value = false
M_TRAIN_FIGURE_TOC_TYPE_FIELD.default_value = 0
M_TRAIN_FIGURE_TOC_TYPE_FIELD.type = 5
M_TRAIN_FIGURE_TOC_TYPE_FIELD.cpp_type = 1

M_TRAIN_FIGURE_TOC.name = "m_train_figure_toc"
M_TRAIN_FIGURE_TOC.full_name = ".m_train_figure_toc"
M_TRAIN_FIGURE_TOC.nested_types = {}
M_TRAIN_FIGURE_TOC.enum_types = {}
M_TRAIN_FIGURE_TOC.fields = {M_TRAIN_FIGURE_TOC_TYPE_FIELD}
M_TRAIN_FIGURE_TOC.is_extendable = false
M_TRAIN_FIGURE_TOC.extensions = {}
M_TRAIN_ATTR_TOS_TYPE_FIELD.name = "type"
M_TRAIN_ATTR_TOS_TYPE_FIELD.full_name = ".m_train_attr_tos.type"
M_TRAIN_ATTR_TOS_TYPE_FIELD.number = 1
M_TRAIN_ATTR_TOS_TYPE_FIELD.index = 0
M_TRAIN_ATTR_TOS_TYPE_FIELD.label = 2
M_TRAIN_ATTR_TOS_TYPE_FIELD.has_default_value = false
M_TRAIN_ATTR_TOS_TYPE_FIELD.default_value = 0
M_TRAIN_ATTR_TOS_TYPE_FIELD.type = 5
M_TRAIN_ATTR_TOS_TYPE_FIELD.cpp_type = 1

M_TRAIN_ATTR_TOS_ITEM_ID_FIELD.name = "item_id"
M_TRAIN_ATTR_TOS_ITEM_ID_FIELD.full_name = ".m_train_attr_tos.item_id"
M_TRAIN_ATTR_TOS_ITEM_ID_FIELD.number = 2
M_TRAIN_ATTR_TOS_ITEM_ID_FIELD.index = 1
M_TRAIN_ATTR_TOS_ITEM_ID_FIELD.label = 2
M_TRAIN_ATTR_TOS_ITEM_ID_FIELD.has_default_value = false
M_TRAIN_ATTR_TOS_ITEM_ID_FIELD.default_value = 0
M_TRAIN_ATTR_TOS_ITEM_ID_FIELD.type = 5
M_TRAIN_ATTR_TOS_ITEM_ID_FIELD.cpp_type = 1

M_TRAIN_ATTR_TOS.name = "m_train_attr_tos"
M_TRAIN_ATTR_TOS.full_name = ".m_train_attr_tos"
M_TRAIN_ATTR_TOS.nested_types = {}
M_TRAIN_ATTR_TOS.enum_types = {}
M_TRAIN_ATTR_TOS.fields = {M_TRAIN_ATTR_TOS_TYPE_FIELD, M_TRAIN_ATTR_TOS_ITEM_ID_FIELD}
M_TRAIN_ATTR_TOS.is_extendable = false
M_TRAIN_ATTR_TOS.extensions = {}
M_TRAIN_ATTR_TOC_TYPE_FIELD.name = "type"
M_TRAIN_ATTR_TOC_TYPE_FIELD.full_name = ".m_train_attr_toc.type"
M_TRAIN_ATTR_TOC_TYPE_FIELD.number = 1
M_TRAIN_ATTR_TOC_TYPE_FIELD.index = 0
M_TRAIN_ATTR_TOC_TYPE_FIELD.label = 2
M_TRAIN_ATTR_TOC_TYPE_FIELD.has_default_value = false
M_TRAIN_ATTR_TOC_TYPE_FIELD.default_value = 0
M_TRAIN_ATTR_TOC_TYPE_FIELD.type = 5
M_TRAIN_ATTR_TOC_TYPE_FIELD.cpp_type = 1

M_TRAIN_ATTR_TOC_ITEM_ID_FIELD.name = "item_id"
M_TRAIN_ATTR_TOC_ITEM_ID_FIELD.full_name = ".m_train_attr_toc.item_id"
M_TRAIN_ATTR_TOC_ITEM_ID_FIELD.number = 2
M_TRAIN_ATTR_TOC_ITEM_ID_FIELD.index = 1
M_TRAIN_ATTR_TOC_ITEM_ID_FIELD.label = 2
M_TRAIN_ATTR_TOC_ITEM_ID_FIELD.has_default_value = false
M_TRAIN_ATTR_TOC_ITEM_ID_FIELD.default_value = 0
M_TRAIN_ATTR_TOC_ITEM_ID_FIELD.type = 5
M_TRAIN_ATTR_TOC_ITEM_ID_FIELD.cpp_type = 1

M_TRAIN_ATTR_TOC_LEVEL_FIELD.name = "level"
M_TRAIN_ATTR_TOC_LEVEL_FIELD.full_name = ".m_train_attr_toc.level"
M_TRAIN_ATTR_TOC_LEVEL_FIELD.number = 3
M_TRAIN_ATTR_TOC_LEVEL_FIELD.index = 2
M_TRAIN_ATTR_TOC_LEVEL_FIELD.label = 2
M_TRAIN_ATTR_TOC_LEVEL_FIELD.has_default_value = false
M_TRAIN_ATTR_TOC_LEVEL_FIELD.default_value = 0
M_TRAIN_ATTR_TOC_LEVEL_FIELD.type = 5
M_TRAIN_ATTR_TOC_LEVEL_FIELD.cpp_type = 1

M_TRAIN_ATTR_TOC.name = "m_train_attr_toc"
M_TRAIN_ATTR_TOC.full_name = ".m_train_attr_toc"
M_TRAIN_ATTR_TOC.nested_types = {}
M_TRAIN_ATTR_TOC.enum_types = {}
M_TRAIN_ATTR_TOC.fields = {M_TRAIN_ATTR_TOC_TYPE_FIELD, M_TRAIN_ATTR_TOC_ITEM_ID_FIELD, M_TRAIN_ATTR_TOC_LEVEL_FIELD}
M_TRAIN_ATTR_TOC.is_extendable = false
M_TRAIN_ATTR_TOC.extensions = {}
P_TRAIN_TRAINENTRY_KEY_FIELD.name = "key"
P_TRAIN_TRAINENTRY_KEY_FIELD.full_name = ".p_train.TrainEntry.key"
P_TRAIN_TRAINENTRY_KEY_FIELD.number = 1
P_TRAIN_TRAINENTRY_KEY_FIELD.index = 0
P_TRAIN_TRAINENTRY_KEY_FIELD.label = 1
P_TRAIN_TRAINENTRY_KEY_FIELD.has_default_value = false
P_TRAIN_TRAINENTRY_KEY_FIELD.default_value = 0
P_TRAIN_TRAINENTRY_KEY_FIELD.type = 5
P_TRAIN_TRAINENTRY_KEY_FIELD.cpp_type = 1

P_TRAIN_TRAINENTRY_VALUE_FIELD.name = "value"
P_TRAIN_TRAINENTRY_VALUE_FIELD.full_name = ".p_train.TrainEntry.value"
P_TRAIN_TRAINENTRY_VALUE_FIELD.number = 2
P_TRAIN_TRAINENTRY_VALUE_FIELD.index = 1
P_TRAIN_TRAINENTRY_VALUE_FIELD.label = 1
P_TRAIN_TRAINENTRY_VALUE_FIELD.has_default_value = false
P_TRAIN_TRAINENTRY_VALUE_FIELD.default_value = 0
P_TRAIN_TRAINENTRY_VALUE_FIELD.type = 5
P_TRAIN_TRAINENTRY_VALUE_FIELD.cpp_type = 1

P_TRAIN_TRAINENTRY.name = "TrainEntry"
P_TRAIN_TRAINENTRY.full_name = ".p_train.TrainEntry"
P_TRAIN_TRAINENTRY.nested_types = {}
P_TRAIN_TRAINENTRY.enum_types = {}
P_TRAIN_TRAINENTRY.fields = {P_TRAIN_TRAINENTRY_KEY_FIELD, P_TRAIN_TRAINENTRY_VALUE_FIELD}
P_TRAIN_TRAINENTRY.is_extendable = false
P_TRAIN_TRAINENTRY.extensions = {}
P_TRAIN_TRAINENTRY.containing_type = P_TRAIN
P_TRAIN_TYPE_FIELD.name = "type"
P_TRAIN_TYPE_FIELD.full_name = ".p_train.type"
P_TRAIN_TYPE_FIELD.number = 1
P_TRAIN_TYPE_FIELD.index = 0
P_TRAIN_TYPE_FIELD.label = 2
P_TRAIN_TYPE_FIELD.has_default_value = false
P_TRAIN_TYPE_FIELD.default_value = 0
P_TRAIN_TYPE_FIELD.type = 5
P_TRAIN_TYPE_FIELD.cpp_type = 1

P_TRAIN_LEVEL_FIELD.name = "level"
P_TRAIN_LEVEL_FIELD.full_name = ".p_train.level"
P_TRAIN_LEVEL_FIELD.number = 2
P_TRAIN_LEVEL_FIELD.index = 1
P_TRAIN_LEVEL_FIELD.label = 2
P_TRAIN_LEVEL_FIELD.has_default_value = false
P_TRAIN_LEVEL_FIELD.default_value = 0
P_TRAIN_LEVEL_FIELD.type = 5
P_TRAIN_LEVEL_FIELD.cpp_type = 1

P_TRAIN_EXP_FIELD.name = "exp"
P_TRAIN_EXP_FIELD.full_name = ".p_train.exp"
P_TRAIN_EXP_FIELD.number = 3
P_TRAIN_EXP_FIELD.index = 2
P_TRAIN_EXP_FIELD.label = 2
P_TRAIN_EXP_FIELD.has_default_value = false
P_TRAIN_EXP_FIELD.default_value = 0
P_TRAIN_EXP_FIELD.type = 5
P_TRAIN_EXP_FIELD.cpp_type = 1

P_TRAIN_TRAIN_FIELD.name = "train"
P_TRAIN_TRAIN_FIELD.full_name = ".p_train.train"
P_TRAIN_TRAIN_FIELD.number = 4
P_TRAIN_TRAIN_FIELD.index = 3
P_TRAIN_TRAIN_FIELD.label = 3
P_TRAIN_TRAIN_FIELD.has_default_value = false
P_TRAIN_TRAIN_FIELD.default_value = {}
P_TRAIN_TRAIN_FIELD.message_type = P_TRAIN_TRAINENTRY
P_TRAIN_TRAIN_FIELD.type = 11
P_TRAIN_TRAIN_FIELD.cpp_type = 10

P_TRAIN.name = "p_train"
P_TRAIN.full_name = ".p_train"
P_TRAIN.nested_types = {P_TRAIN_TRAINENTRY}
P_TRAIN.enum_types = {}
P_TRAIN.fields = {P_TRAIN_TYPE_FIELD, P_TRAIN_LEVEL_FIELD, P_TRAIN_EXP_FIELD, P_TRAIN_TRAIN_FIELD}
P_TRAIN.is_extendable = false
P_TRAIN.extensions = {}

m_train_attr_toc = protobuf.Message(M_TRAIN_ATTR_TOC)
m_train_attr_tos = protobuf.Message(M_TRAIN_ATTR_TOS)
m_train_figure_toc = protobuf.Message(M_TRAIN_FIGURE_TOC)
m_train_figure_tos = protobuf.Message(M_TRAIN_FIGURE_TOS)
m_train_info_toc = protobuf.Message(M_TRAIN_INFO_TOC)
m_train_info_tos = protobuf.Message(M_TRAIN_INFO_TOS)
m_train_upgrade_toc = protobuf.Message(M_TRAIN_UPGRADE_TOC)
m_train_upgrade_tos = protobuf.Message(M_TRAIN_UPGRADE_TOS)
p_train = protobuf.Message(P_TRAIN)
p_train.TrainEntry = protobuf.Message(P_TRAIN_TRAINENTRY)

