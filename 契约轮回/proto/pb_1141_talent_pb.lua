-- Generated By protoc-gen-lua Do not Edit
local protobuf = require "tolua.protobuf/protobuf"
module('pb_1141_talent_pb')


M_TALENT_INFO_TOS = protobuf.Descriptor();
M_TALENT_INFO_TOC = protobuf.Descriptor();
M_TALENT_INFO_TOC_SKILLSENTRY = protobuf.Descriptor();
M_TALENT_INFO_TOC_SKILLSENTRY_KEY_FIELD = protobuf.FieldDescriptor();
M_TALENT_INFO_TOC_SKILLSENTRY_VALUE_FIELD = protobuf.FieldDescriptor();
M_TALENT_INFO_TOC_POINT_FIELD = protobuf.FieldDescriptor();
M_TALENT_INFO_TOC_SKILLS_FIELD = protobuf.FieldDescriptor();
M_TALENT_UPGRADE_TOS = protobuf.Descriptor();
M_TALENT_UPGRADE_TOS_ID_FIELD = protobuf.FieldDescriptor();
M_TALENT_UPGRADE_TOC = protobuf.Descriptor();
M_TALENT_UPGRADE_TOC_ID_FIELD = protobuf.FieldDescriptor();
M_TALENT_UPGRADE_TOC_POINT_FIELD = protobuf.FieldDescriptor();
M_TALENT_RESET_TOS = protobuf.Descriptor();
M_TALENT_RESET_TOC = protobuf.Descriptor();
M_TALENT_POINT_TOC = protobuf.Descriptor();
M_TALENT_POINT_TOC_POINT_FIELD = protobuf.FieldDescriptor();

M_TALENT_INFO_TOS.name = "m_talent_info_tos"
M_TALENT_INFO_TOS.full_name = ".m_talent_info_tos"
M_TALENT_INFO_TOS.nested_types = {}
M_TALENT_INFO_TOS.enum_types = {}
M_TALENT_INFO_TOS.fields = {}
M_TALENT_INFO_TOS.is_extendable = false
M_TALENT_INFO_TOS.extensions = {}
M_TALENT_INFO_TOC_SKILLSENTRY_KEY_FIELD.name = "key"
M_TALENT_INFO_TOC_SKILLSENTRY_KEY_FIELD.full_name = ".m_talent_info_toc.SkillsEntry.key"
M_TALENT_INFO_TOC_SKILLSENTRY_KEY_FIELD.number = 1
M_TALENT_INFO_TOC_SKILLSENTRY_KEY_FIELD.index = 0
M_TALENT_INFO_TOC_SKILLSENTRY_KEY_FIELD.label = 1
M_TALENT_INFO_TOC_SKILLSENTRY_KEY_FIELD.has_default_value = false
M_TALENT_INFO_TOC_SKILLSENTRY_KEY_FIELD.default_value = 0
M_TALENT_INFO_TOC_SKILLSENTRY_KEY_FIELD.type = 5
M_TALENT_INFO_TOC_SKILLSENTRY_KEY_FIELD.cpp_type = 1

M_TALENT_INFO_TOC_SKILLSENTRY_VALUE_FIELD.name = "value"
M_TALENT_INFO_TOC_SKILLSENTRY_VALUE_FIELD.full_name = ".m_talent_info_toc.SkillsEntry.value"
M_TALENT_INFO_TOC_SKILLSENTRY_VALUE_FIELD.number = 2
M_TALENT_INFO_TOC_SKILLSENTRY_VALUE_FIELD.index = 1
M_TALENT_INFO_TOC_SKILLSENTRY_VALUE_FIELD.label = 1
M_TALENT_INFO_TOC_SKILLSENTRY_VALUE_FIELD.has_default_value = false
M_TALENT_INFO_TOC_SKILLSENTRY_VALUE_FIELD.default_value = 0
M_TALENT_INFO_TOC_SKILLSENTRY_VALUE_FIELD.type = 5
M_TALENT_INFO_TOC_SKILLSENTRY_VALUE_FIELD.cpp_type = 1

M_TALENT_INFO_TOC_SKILLSENTRY.name = "SkillsEntry"
M_TALENT_INFO_TOC_SKILLSENTRY.full_name = ".m_talent_info_toc.SkillsEntry"
M_TALENT_INFO_TOC_SKILLSENTRY.nested_types = {}
M_TALENT_INFO_TOC_SKILLSENTRY.enum_types = {}
M_TALENT_INFO_TOC_SKILLSENTRY.fields = {M_TALENT_INFO_TOC_SKILLSENTRY_KEY_FIELD, M_TALENT_INFO_TOC_SKILLSENTRY_VALUE_FIELD}
M_TALENT_INFO_TOC_SKILLSENTRY.is_extendable = false
M_TALENT_INFO_TOC_SKILLSENTRY.extensions = {}
M_TALENT_INFO_TOC_SKILLSENTRY.containing_type = M_TALENT_INFO_TOC
M_TALENT_INFO_TOC_POINT_FIELD.name = "point"
M_TALENT_INFO_TOC_POINT_FIELD.full_name = ".m_talent_info_toc.point"
M_TALENT_INFO_TOC_POINT_FIELD.number = 1
M_TALENT_INFO_TOC_POINT_FIELD.index = 0
M_TALENT_INFO_TOC_POINT_FIELD.label = 2
M_TALENT_INFO_TOC_POINT_FIELD.has_default_value = false
M_TALENT_INFO_TOC_POINT_FIELD.default_value = 0
M_TALENT_INFO_TOC_POINT_FIELD.type = 5
M_TALENT_INFO_TOC_POINT_FIELD.cpp_type = 1

M_TALENT_INFO_TOC_SKILLS_FIELD.name = "skills"
M_TALENT_INFO_TOC_SKILLS_FIELD.full_name = ".m_talent_info_toc.skills"
M_TALENT_INFO_TOC_SKILLS_FIELD.number = 2
M_TALENT_INFO_TOC_SKILLS_FIELD.index = 1
M_TALENT_INFO_TOC_SKILLS_FIELD.label = 3
M_TALENT_INFO_TOC_SKILLS_FIELD.has_default_value = false
M_TALENT_INFO_TOC_SKILLS_FIELD.default_value = {}
M_TALENT_INFO_TOC_SKILLS_FIELD.message_type = M_TALENT_INFO_TOC_SKILLSENTRY
M_TALENT_INFO_TOC_SKILLS_FIELD.type = 11
M_TALENT_INFO_TOC_SKILLS_FIELD.cpp_type = 10

M_TALENT_INFO_TOC.name = "m_talent_info_toc"
M_TALENT_INFO_TOC.full_name = ".m_talent_info_toc"
M_TALENT_INFO_TOC.nested_types = {M_TALENT_INFO_TOC_SKILLSENTRY}
M_TALENT_INFO_TOC.enum_types = {}
M_TALENT_INFO_TOC.fields = {M_TALENT_INFO_TOC_POINT_FIELD, M_TALENT_INFO_TOC_SKILLS_FIELD}
M_TALENT_INFO_TOC.is_extendable = false
M_TALENT_INFO_TOC.extensions = {}
M_TALENT_UPGRADE_TOS_ID_FIELD.name = "id"
M_TALENT_UPGRADE_TOS_ID_FIELD.full_name = ".m_talent_upgrade_tos.id"
M_TALENT_UPGRADE_TOS_ID_FIELD.number = 1
M_TALENT_UPGRADE_TOS_ID_FIELD.index = 0
M_TALENT_UPGRADE_TOS_ID_FIELD.label = 2
M_TALENT_UPGRADE_TOS_ID_FIELD.has_default_value = false
M_TALENT_UPGRADE_TOS_ID_FIELD.default_value = 0
M_TALENT_UPGRADE_TOS_ID_FIELD.type = 5
M_TALENT_UPGRADE_TOS_ID_FIELD.cpp_type = 1

M_TALENT_UPGRADE_TOS.name = "m_talent_upgrade_tos"
M_TALENT_UPGRADE_TOS.full_name = ".m_talent_upgrade_tos"
M_TALENT_UPGRADE_TOS.nested_types = {}
M_TALENT_UPGRADE_TOS.enum_types = {}
M_TALENT_UPGRADE_TOS.fields = {M_TALENT_UPGRADE_TOS_ID_FIELD}
M_TALENT_UPGRADE_TOS.is_extendable = false
M_TALENT_UPGRADE_TOS.extensions = {}
M_TALENT_UPGRADE_TOC_ID_FIELD.name = "id"
M_TALENT_UPGRADE_TOC_ID_FIELD.full_name = ".m_talent_upgrade_toc.id"
M_TALENT_UPGRADE_TOC_ID_FIELD.number = 1
M_TALENT_UPGRADE_TOC_ID_FIELD.index = 0
M_TALENT_UPGRADE_TOC_ID_FIELD.label = 2
M_TALENT_UPGRADE_TOC_ID_FIELD.has_default_value = false
M_TALENT_UPGRADE_TOC_ID_FIELD.default_value = 0
M_TALENT_UPGRADE_TOC_ID_FIELD.type = 5
M_TALENT_UPGRADE_TOC_ID_FIELD.cpp_type = 1

M_TALENT_UPGRADE_TOC_POINT_FIELD.name = "point"
M_TALENT_UPGRADE_TOC_POINT_FIELD.full_name = ".m_talent_upgrade_toc.point"
M_TALENT_UPGRADE_TOC_POINT_FIELD.number = 2
M_TALENT_UPGRADE_TOC_POINT_FIELD.index = 1
M_TALENT_UPGRADE_TOC_POINT_FIELD.label = 2
M_TALENT_UPGRADE_TOC_POINT_FIELD.has_default_value = false
M_TALENT_UPGRADE_TOC_POINT_FIELD.default_value = 0
M_TALENT_UPGRADE_TOC_POINT_FIELD.type = 5
M_TALENT_UPGRADE_TOC_POINT_FIELD.cpp_type = 1

M_TALENT_UPGRADE_TOC.name = "m_talent_upgrade_toc"
M_TALENT_UPGRADE_TOC.full_name = ".m_talent_upgrade_toc"
M_TALENT_UPGRADE_TOC.nested_types = {}
M_TALENT_UPGRADE_TOC.enum_types = {}
M_TALENT_UPGRADE_TOC.fields = {M_TALENT_UPGRADE_TOC_ID_FIELD, M_TALENT_UPGRADE_TOC_POINT_FIELD}
M_TALENT_UPGRADE_TOC.is_extendable = false
M_TALENT_UPGRADE_TOC.extensions = {}
M_TALENT_RESET_TOS.name = "m_talent_reset_tos"
M_TALENT_RESET_TOS.full_name = ".m_talent_reset_tos"
M_TALENT_RESET_TOS.nested_types = {}
M_TALENT_RESET_TOS.enum_types = {}
M_TALENT_RESET_TOS.fields = {}
M_TALENT_RESET_TOS.is_extendable = false
M_TALENT_RESET_TOS.extensions = {}
M_TALENT_RESET_TOC.name = "m_talent_reset_toc"
M_TALENT_RESET_TOC.full_name = ".m_talent_reset_toc"
M_TALENT_RESET_TOC.nested_types = {}
M_TALENT_RESET_TOC.enum_types = {}
M_TALENT_RESET_TOC.fields = {}
M_TALENT_RESET_TOC.is_extendable = false
M_TALENT_RESET_TOC.extensions = {}
M_TALENT_POINT_TOC_POINT_FIELD.name = "point"
M_TALENT_POINT_TOC_POINT_FIELD.full_name = ".m_talent_point_toc.point"
M_TALENT_POINT_TOC_POINT_FIELD.number = 1
M_TALENT_POINT_TOC_POINT_FIELD.index = 0
M_TALENT_POINT_TOC_POINT_FIELD.label = 2
M_TALENT_POINT_TOC_POINT_FIELD.has_default_value = false
M_TALENT_POINT_TOC_POINT_FIELD.default_value = 0
M_TALENT_POINT_TOC_POINT_FIELD.type = 5
M_TALENT_POINT_TOC_POINT_FIELD.cpp_type = 1

M_TALENT_POINT_TOC.name = "m_talent_point_toc"
M_TALENT_POINT_TOC.full_name = ".m_talent_point_toc"
M_TALENT_POINT_TOC.nested_types = {}
M_TALENT_POINT_TOC.enum_types = {}
M_TALENT_POINT_TOC.fields = {M_TALENT_POINT_TOC_POINT_FIELD}
M_TALENT_POINT_TOC.is_extendable = false
M_TALENT_POINT_TOC.extensions = {}

m_talent_info_toc = protobuf.Message(M_TALENT_INFO_TOC)
m_talent_info_toc.SkillsEntry = protobuf.Message(M_TALENT_INFO_TOC_SKILLSENTRY)
m_talent_info_tos = protobuf.Message(M_TALENT_INFO_TOS)
m_talent_point_toc = protobuf.Message(M_TALENT_POINT_TOC)
m_talent_reset_toc = protobuf.Message(M_TALENT_RESET_TOC)
m_talent_reset_tos = protobuf.Message(M_TALENT_RESET_TOS)
m_talent_upgrade_toc = protobuf.Message(M_TALENT_UPGRADE_TOC)
m_talent_upgrade_tos = protobuf.Message(M_TALENT_UPGRADE_TOS)

