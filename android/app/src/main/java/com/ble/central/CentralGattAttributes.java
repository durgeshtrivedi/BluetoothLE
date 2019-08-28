/*
 * Copyright (C) 2013 The Android Open Source Project
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
 */

package com.ble.central;

import java.util.HashMap;

/**
 * This class includes a small subset of standard GATT attributes for demonstration purposes.
 */
public class CentralGattAttributes {
    private static HashMap<String, String> attributes = new HashMap();
    public static String CT350_PERIPHERAL_NAME = "Peripheral";
    public static String CT350_PERIPHERAL_ID = "62443cc7-15bc-4136-bf5d-0ad80c459215";
    public static final String CT350_SERVICE_UUID = "0cdbe648-eed0-11e6-bc64-92361f002671";
    public static final String CT350_CHARACTERISTIC_UUID = "199ab74c-eed0-11e6-bc64-92361f002672";


    static {
          attributes.put(CT350_SERVICE_UUID, "Peripheral Service");
          attributes.put(CT350_CHARACTERISTIC_UUID, "Peripheral Characteristics");
    }

    public static String lookup(String uuid, String defaultName) {
        String name = attributes.get(uuid);
        return name == null ? defaultName : name;
    }
}
