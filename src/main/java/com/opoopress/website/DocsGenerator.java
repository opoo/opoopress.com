package com.opoopress.website;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.lang.math.NumberUtils;
import org.opoo.press.Generator;
import org.opoo.press.Page;
import org.opoo.press.Site;

/**
 * @author Alex Lin
 *
 */
public class DocsGenerator implements Generator {

	/* (non-Javadoc)
	 * @see org.opoo.press.Ordered#getOrder()
	 */
	@Override
	public int getOrder() {
		return Integer.MAX_VALUE - 100;
	}

	/* (non-Javadoc)
	 * @see org.opoo.press.Generator#generate(org.opoo.press.Site)
	 */
	@Override
	public void generate(Site site) {
		List<Page> docs = new ArrayList<Page>();
		List<Page> pages = site.getPages();
		for(Page page: pages){
			if(isDoc(page)){
				page.set("comments", true);
				docs.add(page);
			}
		}
		if(!docs.isEmpty()){
			Collections.sort(docs, new DocComparator());
		}
		
		setPreviousOrNextPageUrl(docs);
		site.set("docs", docs);

		String version = Site.class.getPackage().getSpecificationVersion();
		site.set("OpooPressVersion", version);
	}

	/**
	 * @param docs
	 */
	private void setPreviousOrNextPageUrl(List<Page> docs) {
		Iterator<Page> it = docs.iterator();
		Page prev = null;
		Page current = null;
		while(it.hasNext()){
			current = it.next();
			if(prev != null){
				prev.set("next_doc", current);
				current.set("prev_doc", prev);
			}
			prev = current;
		}
	}

	public static boolean isDoc(Page page){
		return "doc".equals(page.getLayout());
	}
	
	public static int getDocIndex(Page page){
		Object val = page.get("index");
		if(val == null){
			return -1;
		}
		if(val instanceof Number){
			return ((Number)val).intValue();
		}
		if(val instanceof String){
			return NumberUtils.toInt((String) val);
		}
		return NumberUtils.toInt(val.toString());
	}
	
	static class DocComparator implements Comparator<Page>{
		/* (non-Javadoc)
		 * @see java.util.Comparator#compare(java.lang.Object, java.lang.Object)
		 */
		@Override
		public int compare(Page o1, Page o2) {
			int docIndex1 = getDocIndex(o1);
			int docIndex2 = getDocIndex(o2);
			return docIndex1 - docIndex2;
		}
	}
}
