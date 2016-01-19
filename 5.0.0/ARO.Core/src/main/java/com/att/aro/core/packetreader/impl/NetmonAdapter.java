package com.att.aro.core.packetreader.impl;

import com.att.aro.core.packetreader.INetmonPacketSubscriber;
import com.att.aro.core.util.Util;

public class NetmonAdapter {
	INetmonPacketSubscriber subscriber = null;
	
	/**
	 * Executes all packets from the Microsoft Network Monitor cap files.
	 * 
	 * @param filename
	 *            cap file name.
	 * @return result non zero if any error occurs while looping, else success
	 *         message.
	 */
	private native int parseTrace(String filename);
	
	
	public void setSubscriber(INetmonPacketSubscriber subscriber){
		this.subscriber = subscriber;
	}
	public int parseTraceFile(String filename){
		return this.parseTrace(filename);
	}
	public void loadNativeLibs() {
		String osname = System.getProperty("os.arch");
		if (osname != null && osname.contains("64")) {
			String filename = "NMCap64.dll";
			String libFolder = Util.makeLibFilesFromJar(filename);
			Util.loadLibrary(filename, libFolder);
//			System.loadLibrary("NMCap64");
		} else {
			String filename = "NMCap.dll";
			String libFolder = Util.makeLibFilesFromJar(filename);
			Util.loadLibrary(filename, libFolder);
//			System.loadLibrary("NMCap");
		}
	}
	/**
	 * Callback listener used by the native code that accesses pcap
	 * 
	 * @param datalink
	 * @param seconds
	 * @param microSeconds
	 * @param len
	 * @param data
	 */
	public void pcapHandler(int datalink, long seconds, long microSeconds,
			int len, byte[] data, String appName) {
		if(this.subscriber != null){
			this.subscriber.receiveNetmonPacket(datalink, seconds, microSeconds, len, data, appName);
		}
		
	}
	
}
