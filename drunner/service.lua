-- drunner service configuration for helloworld

function setup()
-- addconfig(NAME, DESCRIPTION, DEFAULT VALUE, TYPE, REQUIRED)
   addconfig("SECRETWORD","The secret word to use","squirrel","string",true)

-- addvolume(NAME, BACKUP, EXTERNAL)    

-- addcontainer(NAME). First one must always be this container.
   addcontainer("drunner/helloworld")

end

function run()
  result=drun(dsub("docker run --rm -e SECRETWORD=${SECRETWORD} drunner/helloworld helloworld ${SERVICENAME} "))
  if result~=0 then
     print("Failed to run helloworld.")
   end
end

function stop()
  print("What?")
end

function help()
   return dsub([[
   NAME
      ${SERVICENAME}

   SYNOPSIS
      ${SERVICENAME} help
         This help.

      ${SERVICENAME} run
         Say hello to the world.

      ${SERVICENAME} configure SECRETWORD
         Set the secret word.

   DESCRIPTION
      A simple dRunner example. Built from ${IMAGENAME}.
   ]])
end
