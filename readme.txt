--------------------------
Compile/build requirements
--------------------------

Java JDK 1.5+
Ant 1.7+

--------------------
Runtime requirements
--------------------

Drupal 6.x
Fedora 3.x
Islandora fedora_collections module
adore-djatoka 1.1
A Servlet 2.4 compatible servlet engine (the Tomcat 5.5 distributed with fedora will do nicely).

----------------------------------------------
Third-party code included in this distribution
----------------------------------------------

- jquery 1.3.2
- jquery-ui 1.7.2 (custom build - core, slider, dialog features only, with smoothness theme)
- OpenLayers 2.7 
- OpenLayers-Djatoka plugin (http://philomousos.blogspot.com/2008/12/- openlayers-and-djatoka.html and http://github.com/hcayless/djatoka-openlayers-image-viewer/tree/master)

--------------------------------------------------
Building and installing the Islandora Image Viewer
--------------------------------------------------

1. run the 'ant war' task.

2. deploy iiv.war to your servlet engine 

Due to XMLHttpRequest (ajax) restrictions, you should deploy iiv.war to the 
same servlet engine as the fedora and adore-djatoka web apps, or front all
of these services with a single forward proxy, so the host and port appear
to be the same from the client's perspective.

Due to some css path dependencies, the war file must be deployed under its
default context name/path ('/iiv').

Note: if you set the 'iiv.deployDir' property in build.xml to the correct 
location for your site, you can combine step 1 and 2 by running 'ant deploy'

3. ingest the fedora service objects in etc/fedora-objects

Update the ilives:bookCModel:
- add a hasService relation to ilives:viewerSdef.
- add ISLANDORACM datastream with showStreamsInFieldSet.showJP2() definition (see /etc/islandora/islandoracm.xml)

Note: I also changed the pid from ilives:BookCModel to ilives:bookCModel. 
The ilives:bunbury collection used the lower case version, even though the pid didn't exist.  

Update the ilives:pageCModel:
- make the same changes as the bookCModel.
- add a hasService relation to ilives:jp2Sdef.
- add a hasService relation to ilives:tei2htmlSdef.  

I used the same islandoracm.xml. It works for the viewer, 
but probably does horrible things to the islandora ingest process for these objects. 

4. add JP2 streams to target pageCModel objects.

**Note: JP2 stream should be added to the ilives:pageCModel**

5. update showStreamsInFieldSets.php (see etc/islandora.showStreamsInFieldSets.txt)

6. Make sure your Drupal repository settings include Fedora base url that is 
valid for clients requests to fedora (i.e. not localhost). 