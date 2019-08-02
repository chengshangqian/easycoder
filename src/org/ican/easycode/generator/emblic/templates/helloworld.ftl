<html> 
<head> 
  <title>Welcome!</title> 
</head> 
<body> 
  <h1>Welcome ${user}!</h1> 
  <p>Our latest product:<a href="${latestProduct.url}">${latestProduct.name}</a>! </p>
  <#list seq as x>
  <#switch StringUtils.trimToEmpty(x)>
  <#case "">
  <p>${x_index + 1}. [${StringUtils.trimToEmpty(x)}] ==> EMPTY </p>
  <#break>
  <#case "email">
  <#case "url">
  <#case "date">
  <#case "number">
  <#case "digits">
  <p>${x_index + 1}. ${StringUtils.trimToEmpty(x)} ==> VALIDATE </p>
  <#break>
  <#default>
  <p>${x_index + 1}. ${StringUtils.trimToEmpty(x)} ==> DEFAULT </p>
  </#switch>
  </#list>
</body> 
</html>