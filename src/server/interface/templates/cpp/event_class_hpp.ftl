${event.name}.hpp
/* Autogenerated with Kurento Idl */

#ifndef __${camelToUnderscore(event.name)}_HPP__
#define __${camelToUnderscore(event.name)}_HPP__

#include <jsoncpp/json/json.h>
#include <memory>

<#if event.extends??>
#include "${event.extends.name}.hpp"
</#if>

namespace kurento {
class JsonSerializer;
class ${event.name};
<#list event.properties as property>
<#if model.remoteClasses?seq_contains(property.type.type) ||
  model.complexTypes?seq_contains(property.type.type) ||
  model.events?seq_contains(property.type.type)>
class ${property.type.name};
</#if>
</#list>

void Serialize(kurento::${event.name}& event, JsonSerializer& s);

class ${event.name}<#if event.extends??> : public virtual ${event.extends.name}</#if>
{

public:

  ${event.name} (<#rt>
    <#lt><#assign first = true><#rt>
    <#lt><#list event.properties as property><#rt>
      <#lt><#if !property.optional><#rt>
        <#lt><#if !first>, </#if><#rt>
        <#lt><#assign first = false><#rt>
        <#lt>${getCppObjectType(property.type.name)} ${property.name}<#rt>
      <#lt></#if><#rt>
    <#lt></#list><#rt>
    <#lt><#list event.parentProperties as property><#rt>
      <#lt><#if !property.optional><#rt>
        <#lt><#if !first>, </#if><#rt>
        <#lt><#assign first = false><#rt>
        <#lt>${getCppObjectType(property.type.name)} ${property.name}<#rt>
      <#lt></#if><#rt>
    <#lt></#list>)<#rt>
    <#lt><#assign first = true><#rt>
    <#lt><#if event.extends??> : ${event.extends.name} (<#rt>
      <#lt><#list event.parentProperties as property><#rt>
        <#lt><#if !property.optional><#rt>
          <#lt><#if !first>, </#if><#rt>
          <#lt><#assign first = false><#rt>
          <#lt>${property.name}<#rt>
        <#lt></#if><#rt>
    <#lt></#list>)</#if> {
    <#list event.properties as property><#rt>
      <#lt><#if !property.optional><#rt>
    this->${property.name} = ${property.name};
      </#if><#rt>
    <#lt></#list>
  };

  ${event.name} (const Json::Value &value);

  <#list event.properties as property>
  virtual void set${property.name?cap_first} (${getCppObjectType(property.type.name, false)} ${property.name}) {
    this->${property.name} = ${property.name};
    <#if property.optional>
    _isSet${property.name?cap_first} = true;
    </#if>
  };

  virtual ${getCppObjectType(property.type.name)} get${property.name?cap_first} () {
    return ${property.name};
  };

  <#if property.optional>
  virtual bool isSet${property.name?cap_first} () {
    return _isSet${property.name?cap_first};
  };

  </#if>
  </#list>
  static std::string getName() {
    return "${event.name}";
  }

protected:

  ${event.name}() {};

private:
  <#list event.properties as property>
  ${getCppObjectType(property.type.name, false)} ${property.name};
  <#if property.optional>
  bool _isSet${property.name?cap_first} = false;
  </#if>
  </#list>

  friend void Serialize(${event.name}& event, JsonSerializer& s);
};

} /* kurento */

#endif /*  __${camelToUnderscore(event.name)}_HPP__ */