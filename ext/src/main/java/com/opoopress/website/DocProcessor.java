/*
 * Copyright 2013-2015 Alex Lin.
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
package com.opoopress.website;

import com.google.common.base.Predicate;
import com.google.common.collect.Iterables;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import org.apache.commons.io.FileUtils;
import org.opoo.press.Collection;
import org.opoo.press.Page;
import org.opoo.press.ProcessorAdapter;
import org.opoo.press.Site;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.yaml.snakeyaml.Yaml;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Alex Lin
 */
public class DocProcessor extends ProcessorAdapter{
    private static final Logger log = LoggerFactory.getLogger(DocProcessor.class);


    @Override
    public void postRead(Site site) {
        Collection collection = site.getCollections().get("doc");
        List<? extends Page> pages = collection.getPages();

        List<Map<String,Object>> versions = site.getConfig().get("doc_versions");

        System.out.println("Processing doc versions...");
        System.out.println(versions);

        if(versions == null || versions.isEmpty()){
            throw new IllegalArgumentException("doc versions not defined in configuration.");
        }

        for(Map<String,Object> version: versions){
            String ver = (String) version.get("version");
//            String path = (String) version.get("path");
            String urlPrefix = (String) version.get("url_prefix");
            List<Map<String,Object>> items = site.getConfig().get("doc_items_" + ver);

            if(items == null || items.isEmpty()){
                throw new IllegalArgumentException("doc items not found: doc_items_" + ver);
            }

            version.put("items", items);

            for(Map<String,Object> item: items){
//                String title = (String) item.get("title");
                List<String> docs = (List<String>) item.get("docs");
                List<Page> docPages = Lists.newArrayList();
                item.put("pages", docPages);

                for(String doc: docs){
                    final String docUrl = urlPrefix + doc;
                    Page page = Iterables.tryFind(pages, new Predicate<Page>() {
                        @Override
                        public boolean apply(Page input) {
                            return docUrl.equals(input.getUrl());
                        }
                    }).orNull();

                    if(page == null){
                        throw new IllegalStateException("doc url not found: " + docUrl);
                    }
                    docPages.add(page);
                    log.info("Find page for: {} => {}", docUrl, page.getTitle());
                    page.set("version", version);
                }
            }
        }

        System.out.println(versions);
    }


    public static void main(String[] args) throws IOException {
        File file = new File("config-doc.yml");
        Map map1 = new Yaml().loadAs(FileUtils.openInputStream(file), Map.class);
        System.out.println(map1);


        List<String> stringList = Lists.newArrayList();
        stringList.add("/overview/");
        stringList.add("/quickstart/");

        HashMap<Object, Object> map = Maps.newHashMap();
        map.put("docs", stringList);
        System.out.println(new Yaml().dumpAsMap(map));
    }

}
