/**
 * Copyright 2015 AT&T
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * 
 */
package com.att.aro.core.settings;

/**
 * 
 * Interface for ARO Configuration file.  This exists so that the injected Spring bean works
 * off the specific configuration file with specific allowed attributes and file location.
 * In other words, this allows the Spring API specification in AROConfig to easily specify other
 * configuration files down the road via further extensions to ISettings.
 * 
 * @author Nathan F Syfrig
 *
 */
public interface IAROSettings extends ISettings {

}
